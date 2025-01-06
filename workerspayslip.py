
import random

# this Creates a list of workers dynamically
def create_workers(num_workers=400):
    workers = []
    for i in range(num_workers):
        worker = {

            # id created
            "id": f"W{i+1}",
            "name": f"Worker_{i+1}",
            "gender": random.choice(["Male", "Female"]),
            "salary": random.randint(5000, 35000),
        }
        workers.append(worker)
    return workers

# then Generate payment slips and conditional statements
def generate_payment_slips(workers):
    for worker in workers:
        try:
            level = "B1"  # level set to default
            salary = worker["salary"]

            # written logic for Employee levels
            if 10000 < salary < 20000:
                level = "A1"
            if 7500 < salary < 30000 and worker["gender"] == "Female":
                level = "A5-F"

            # creativly generating a payment slip
            print(
                f"ID: {worker['id']}, Name: {worker['name']}, "
                f"Gender: {worker['gender']}, Salary: ${salary}, Level: {level}"
            )
        except Exception as e:
            print(f"Error processing worker {worker['id']}: {e}")

# create a main function and catching the error
if __name__ == "__main__":
    try:
        workers_list = create_workers()
        generate_payment_slips(workers_list)
    except Exception as e:
        print(f"Error in main processing: {e}")
