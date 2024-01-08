const express = require('express');
const bodyParser = require('body-parser');

const app = express();
const port = 8081; // You can change this port if needed

app.use(bodyParser.json());

// Sample cagnottes data (replace this with your actual data)
const cagnottes = [
  { id: 1, name: 'Cagnotte 1' },
  { id: 2, name: 'Cagnotte 2' },
  // Add more cagnottes as needed
];

app.post('/search', (req, res) => {
  const searchTerm = req.body.searchTerm.toLowerCase();
  const results = cagnottes.filter(cagnotte =>
    cagnotte.name.toLowerCase().includes(searchTerm)
  );

  res.json(results);
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
