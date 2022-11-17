<?php

namespace App\Model;

use PDO;

class DevelopperManager extends AbstractManager
{
    public const TABLE = 'developper';

    /**
     * Insert new item in database
     */
    public function insert(array $developper): int
    {
        $statement = $this->pdo->prepare("INSERT INTO " . self::TABLE .
        " (`fname`, `lname`, `project_id`) VALUES (:fname, :lname, :project_id)");
        $statement->bindValue('fname', $developper['fname'], PDO::PARAM_STR);
        $statement->bindValue('lname', $developper['lname'], PDO::PARAM_STR);
        $statement->bindValue('project_id', $developper['project_id'], PDO::PARAM_STR);

        $statement->execute();
        return (int)$this->pdo->lastInsertId();
    }

    public function selectProject(): array
    {
        $query = 'SELECT name FROM project ';

        return $this->pdo->query($query)->fetchAll();
    }
}
