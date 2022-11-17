<?php

namespace App\Model;

use PDO;

class CommentManager extends AbstractManager
{
    public const TABLE = 'comment';

    public function selectAllByProjectId(int $id): array
    {
        $query = "SELECT * FROM " . self::TABLE . " WHERE :id=project_id;";

        $statement = $this->pdo->prepare($query);
        $statement->bindValue('id', $id, PDO::PARAM_INT);
        $statement->execute();

        return $statement->fetchAll();
    }
}
