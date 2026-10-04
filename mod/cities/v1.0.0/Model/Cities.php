<?php

class Cities extends Zend_Db_Table_Abstract
{

    protected $_name = 'core_cities';


    public function getAll()
    {
        $select = $this->select()
            ->order('name ASC');
        return $this->fetchAll($select);
    }

    public function findByName(string $name)
    {
        $select = $this->select()
            ->where('name = ?', $name);
        return $this->fetchRow($select);
    }

    public function insertCity(array $data)
    {
        return $this->insert($data);
    }

    public function updateCity(int $id, array $data)
    {
        $where = $this->getAdapter()->quoteInto('id = ?', $id);
        return $this->update($data, $where);
    }

    public function deleteCity(int $id)
    {
        $where = $this->getAdapter()->quoteInto('id = ?', $id);
        return $this->delete($where);
    }
}