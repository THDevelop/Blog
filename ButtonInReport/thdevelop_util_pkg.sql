 create or replace package thdevelop_util_pkg 
  as
  /**
  * Give a HTML for Redering a Button
  * @param p_item_label label created for the button (NAME).
  * @param p_attributes Controls HTML tag attributes (such as disabled). p_item_id, p_item_class will overwrite
  * @param p_item_id HTML attribute ID. 
  * @param p_item_class HTML attribute CLASS.
  * @param p_onclick set the the on click function.
  */
  function apex_item_button(p_item_label     IN    VARCHAR2,
                            p_attributes     IN    VARCHAR2 DEFAULT NULL,
                            p_item_id        IN    VARCHAR2 DEFAULT NULL,
                            p_item_class     IN    VARCHAR2 DEFAULT NULL,
                            p_onclick        IN    VARCHAR2 DEFAULT NULL
                           )
  return varchar2; 

  end thdevelop_util_pkg;
  /

  create or replace package body thdevelop_util_pkg 
  as
  function apex_item_button(p_item_label     IN    VARCHAR2,
                            p_attributes     IN    VARCHAR2 DEFAULT NULL,
                            p_item_id        IN    VARCHAR2 DEFAULT NULL,
                            p_item_class     IN    VARCHAR2 DEFAULT NULL,
                            p_onclick        IN    VARCHAR2 DEFAULT NULL
                           )
  return varchar2
  as
  l_return varchar2(32767);
  begin
    l_return := q'[<button type="button" ]';
    
    if p_attributes is null then
     
      if p_onclick is not null then
        l_return := l_return || q'[onclick="]' || p_onclick || q'[" ]';
      end if;
     
      if p_item_class is not null then
        l_return := l_return || q'[class="t-Button ]' || p_item_class || q'[" ]';
      else
        l_return := l_return || q'[class="t-Button" ]' ;
      end if;
  
      if p_item_id is not null then
        l_return := l_return || q'[id="]' || p_item_id || q'["]';
      end if;
    else
      l_return := l_return || p_attributes;
    end if;

    l_return := l_return || '>';

    l_return := l_return || q'[<span class="t-Button-label">]'|| p_item_label ||  q'[</span> </button>]';
    return l_return;
  end apex_item_button; 

  end thdevelop_util_pkg ;
  /