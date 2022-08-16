CREATE TABLE patients (
    id INT  PRIMARY KEY,
    name VARCHAR(255),
    date_of_birth DATE,
   
);

CREATE TABLE medical_histories(
    id INT,
    admitted_at TIMESTAMP,
    patient_id INT ,
    status VARCHAR(255),
    REFERENCES patients(id) 
);

CREATE TABLE treatments(
    id INT PRIMARY KEY,
    type VARCHAR(255),
    name VARCHAR(255),
    
);

CREATE TABLE invoices(
    id INT  PRIMARY KEY,
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT,
    REFERENCES medical_histories(id)
);

CREATE TABLE invoice_items(
    id INT PRIMARY KEY,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    invoice_id INT,
    treatment_id INT ,
    
    REFERENCES invoices(id),
   REFERENCES treatments(id)
);


CREATE TABLE medical_histories_treatments (
    
    medical_histories_id INT,
    treatment_id INT,
    CONSTRAINT fk_medical-treatment FOREIGN KEY(medical_histories_id) 
    REFERENCES medical_histories (id),
    CONSTRAINT fk_treatment FOREIGN KEY (treatment_id) REFERENCES treatment(id)
    

)