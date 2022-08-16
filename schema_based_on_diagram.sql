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
    id INT PRIMARY KEY,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    invoice_id INT REFERENCES invoices(id),
    treatment_id INT REFERENCES treatments(id)
);

CREATE TABLE medical_histories_treatments (  
    medical_histories_id INT,
    treatment_id INT,
    CONSTRAINT fk_medical_treatment FOREIGN KEY(medical_histories_id) 
    REFERENCES medical_histories (id),
    CONSTRAINT fk_treatment FOREIGN KEY (treatment_id) REFERENCES treatments(id)
)
CREATE INDEX  medical_history_treatment_id_index ON 
medical_histories_treatments(medical_histories_id);
CREATE INDEX treatment_history_id_index ON 
medical_histories_treatments(treatment_id);
CREATE INDEX patients_id_index ON patients(id);
CREATE INDEX medical_histories_id_index ON medical_histories(id);
CREATE INDEX treatments_id_index ON treatments(id);
CREATE INDEX invoices_id_index ON invoices(id);
CREATE INDEX invoice_items_id_index ON invoice_items(id);
CREATE INDEX patients_name ON patients(name);
