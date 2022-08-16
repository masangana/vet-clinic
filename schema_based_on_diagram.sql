CREATE TABLE patients (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    date_of_birth DATE
);

CREATE TABLE medical_histories(
    id INT PRIMARY KEY,
    admitted_at TIMESTAMP,
    patient_id INT REFERENCES patients(id),
    status VARCHAR(255)
);

CREATE TABLE treatments(
    id INT PRIMARY KEY,
    type VARCHAR(255),
    name VARCHAR(255)
);

CREATE TABLE invoices(
    id INT PRIMARY KEY,
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT REFERENCES medical_histories(id)
);

CREATE TABLE invoice_items(
    id INT PRIMARY KEY,,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    invoice_id INT REFERENCES invoices(id),
    treatment_id INT REFERENCES treatments(id)
);