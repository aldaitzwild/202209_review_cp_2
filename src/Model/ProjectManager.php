<?php

namespace App\Model;

use PDO;

class ProjectManager extends AbstractManager
{
    public const TABLE = 'project';

    public function displayComments($id): array
    {
        $query = "SELECT * FROM  comment as c WHERE c.project_id = $id 
        ORDER BY c.creation_date DESC LIMIT 3;";

        return $this->pdo->query($query)->fetchAll();
    }
}