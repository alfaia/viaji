# 📚 Documentação - Submissão e Consulta de Provas

## ✅ Submeter uma prova respondida

### Endpoint
`POST /submit-exam/`

### Descrição
Este endpoint permite que um estudante envie as respostas de uma prova após realizá-la.

### Exemplo de Requisição

```http
POST http://localhost:8000/submit-exam/
Content-Type: application/json
```

### Corpo da Requisição (JSON):
```json
{
  "student_id": 1,
  "exam_id": 1,
  "answers": [
    {
      "question_id": 1,
      "selected_alternative": 3
    },
    {
      "question_id": 2,
      "selected_alternative": 1
    },
    {
      "question_id": 3,
      "selected_alternative": 2
    },
    {
      "question_id": 5,
      "selected_alternative": 3
    },
    {
      "question_id": 5,
      "selected_alternative": 1
    }
  ]
}
```

### Exemplo de Resposta (Sucesso - HTTP 201 Created):
```json
{
  "detail": "Respostas salvas com sucesso!"
}
```

### Exemplo de Resposta (Erro - Prova já respondida):
```json
{
  "detail": "A prova já foi respondida. Em caso de dúvidas, entre em contato com o responsável."
}
```

## 📊 Consultar o resultado da prova
### Endpoint
`GET /api/exam-result/?student_id=<ID>&exam_id=<ID>`

### Exemplo de Requisição

```http
GET http://localhost:8000/api/exam-result/?student_id=1&exam_id=1
```

### Exemplo de Resposta
```json
{
  "total_questions": 5,
  "correct_answers": 1,
  "accuracy": 20.0,
  "details": [
    {
      "question_id": 1,
      "question_content": "Qual parte do corpo usamos para ouvir?",
      "selected_alternative": "Ouvidos",
      "correct_alternative": "Ouvidos",
      "is_correct": true
    },
    {
      "question_id": 2,
      "question_content": "Qual parte do corpo usamos para ver?",
      "selected_alternative": "Pés",
      "correct_alternative": "Olhos",
      "is_correct": false
    },
    {
      "question_id": 3,
      "question_content": "Qual parte do corpo usamos para cheirar?",
      "selected_alternative": "Língua",
      "correct_alternative": "Nariz",
      "is_correct": false
    },
    {
      "question_id": 5,
      "question_content": "Qual parte do corpo usamos para andar?",
      "selected_alternative": "Braços",
      "correct_alternative": "Pés",
      "is_correct": false
    },
    {
      "question_id": 5,
      "question_content": "Qual parte do corpo usamos para andar?",
      "selected_alternative": "Olhos",
      "correct_alternative": "Pés",
      "is_correct": false
    }
  ]
}
```

## 🧪 Rodando os testes automatizados com pytest

### Pré-requisitos:
Docker instalado e em execução
Projeto rodando com Docker Compose

### 1. Subir o projeto:
```bash
docker-compose up --build
```
### 2. Acessar o container:
```bash
docker exec -it medway-api bash
```
### 3. Executar os testes:
```bash
docker exec -it medway-api bash
```
### Exemplo de saída esperada:
```bash
collected 6 items

answers/tests/test_repositories.py::test_exam_already_submitted_true PASSED
answers/tests/test_repositories.py::test_exam_already_submitted_false PASSED
answers/tests/test_repositories.py::test_get_student_answers_returns_data_correctly PASSED
answers/tests/test_repositories.py::test_get_correct_alternative_returns_correct_one PASSED
answers/tests/test_services.py::test_service_exam_results_with_correct_answer PASSED
answers/tests/test_services.py::test_service_exam_results_with_no_answers PASSED

```

