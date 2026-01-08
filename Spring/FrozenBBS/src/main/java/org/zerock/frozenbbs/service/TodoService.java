package org.zerock.frozenbbs.service;

import org.zerock.frozenbbs.dto.PageRequestDTO;
import org.zerock.frozenbbs.dto.PageResponseDTO;
import org.zerock.frozenbbs.dto.TodoDTO;

import java.util.List;

public interface TodoService {
    void register(TodoDTO dto);
    List<TodoDTO> getAll();
    TodoDTO getById(Long tno);
    void remove(Long tno);
    void edit(TodoDTO dto);
    PageResponseDTO<TodoDTO> getList(PageRequestDTO pageRequestDTO);
}
