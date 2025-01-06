# Create a list of workers dynamically
create_workers <- function(num_workers = 400) {
  workers <- list()
  for (i in 1:num_workers) {
    worker <- list(
      id = paste0("W", i),
      name = paste0("Worker_", i),
      gender = sample(c("Male", "Female"), 1),
      salary = sample(5000:35000, 1)
    )
    workers[[i]] <- worker
  }
  return(workers)
}

# Generate payment slips and conditional statements
generate_payment_slips <- function(workers) {
  for (worker in workers) {
    tryCatch({
      level <- "B1" # set level to default
      salary <- worker$salary

      # written logic for Employee levels
      if (salary > 10000 && salary < 20000) {
        level <- "A1"
      }
      if (salary > 7500 && salary < 30000 && worker$gender == "Female") {
        level <- "A5-F"
      }

      # creatively generating a payment slip
      cat(
        sprintf(
          "ID: %s, Name: %s, Gender: %s, Salary: $%d, Level: %s\n",
          worker$id, worker$name, worker$gender, salary, level
        )
      )
    }, error = function(e) {
      cat(sprintf("Error processing worker %s: %s\n", worker$id, e))
    })
  }
}

# add a Main function
main <- function() {
  workers_list <- create_workers()
  generate_payment_slips(workers_list)
}

# then run the main function 
main()
