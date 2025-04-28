const express = require('express');
const cors = require('cors');
const app = express();
app.use(cors());
app.use(express.json());

// Sample in-memory database
let employees = [];

app.get('/products', (req, res) => {
  res.json(employees);
});

app.post('/products', (req, res) => {
  const { name, price } = req.body;
  employees.push({ name, price });
  res.status(201).send('Employee added successfully');
});

app.listen(5001, () => {
  console.log('Server running on port 5001');
});
