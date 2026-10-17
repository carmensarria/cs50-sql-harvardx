import sqlite3
import ijson

JSON_FILE = "device-enforcement-0001-of-0001.json"
DATABASE_FILE = "project.db"


def format_date(date):
    if not date:
        return None

    return f"{date[:4]}-{date[4:6]}-{date[6:8]}"


connection = sqlite3.connect(DATABASE_FILE)
connection.execute("PRAGMA foreign_keys = ON")

with open(JSON_FILE, "r", encoding="utf-8") as file:
    records = ijson.items(file, "results.item")

    count = 0

    for record in records:
        firm_name = record["recalling_firm"]

        cursor = connection.execute(
            'SELECT "firm_id" FROM "firm" WHERE "name" = ?',
            (firm_name,)
        )

        firm = cursor.fetchone()

        if firm:
            firm_id = firm[0]
        else:
            cursor = connection.execute(
                'INSERT INTO "firm" ("name") VALUES (?)',
                (firm_name,)
            )

            firm_id = cursor.lastrowid

        event_id = int(record["event_id"])

        cursor = connection.execute(
            'SELECT "event_id" FROM "event" WHERE "event_id" = ?',
            (event_id,)
        )

        event = cursor.fetchone()

        if not event:
            connection.execute(
                '''
                INSERT INTO "event" (
                    "event_id",
                    "firm_id",
                    "status",
                    "address_1",
                    "address_2",
                    "city",
                    "state",
                    "country",
                    "postal_code",
                    "voluntary_mandated",
                    "initial_firm_notification",
                    "distribution_pattern",
                    "recall_initiation_date",
                    "report_date"
                )
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
                ''',
                (
                    event_id,
                    firm_id,
                    record["status"],
                    record["address_1"],
                    record["address_2"],
                    record["city"],
                    record["state"],
                    record["country"],
                    record["postal_code"],
                    record["voluntary_mandated"],
                    record["initial_firm_notification"],
                    record["distribution_pattern"],
                    format_date(record["recall_initiation_date"]),
                    format_date(record["report_date"])
                )
            )

        recall_number = record["recall_number"] or None

        connection.execute(
            '''
            INSERT INTO "recall_record" (
                "recall_number",
                "event_id",
                "classification",
                "product_description",
                "product_quantity",
                "reason_for_recall",
                "center_classification_date",
                "code_info",
                "more_code_info"
            )
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
            ''',
            (
                recall_number,
                event_id,
                record["classification"],
                record["product_description"],
                record["product_quantity"] or None,
                record["reason_for_recall"],
                format_date(record.get("center_classification_date")),
                record["code_info"] or None,
                record.get("more_code_info") or None
            )
        )

        count += 1

        if count % 1000 == 0:
            print("Records processed:", count)

connection.commit()
connection.close()

print("Total records inserted:", count)
