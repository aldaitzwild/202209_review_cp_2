<?php

namespace App\Model;

use PDO;

class VoteManager extends AbstractManager
{
    public const TABLE = 'project';

    public function addVote(int $id): bool
    {
        $statement = $this->pdo->prepare("UPDATE " . self::TABLE .
            " SET `number_of_vote` = `number_of_vote`+1 WHERE id=:id");
        $statement->bindValue('id', $id, PDO::PARAM_INT);

        return $statement->execute();
    }
}
