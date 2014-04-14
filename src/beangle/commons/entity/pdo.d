/*
 * Beangle, Agile D Development Scaffold and Toolkit
 *
 * Copyright (c) 2013-2014, Beangle Software.
 *
 * Beangle is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Beangle is distributed in the hope that it will be useful.
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Beangle.  If not, see <http://www.gnu.org/licenses/>.
 */
/**
Plain Data Object.
*/
module beangle.commons.entity.pdo;

import beangle.commons.entity.entity;

/++
Concrete object with generic id.
+/
class IdObject(T):Entity!T {
    
    private  T _id;
    
    @property T id(){
        return _id;
    }
    @property T id(T newid){
        return _id=newid;
    }
}

mixin template CodedBean(){
    private  string _code;
    
    @property string code(){
        return _code;
    }
    
    @property void code(string newcode){
        _code=newcode;
    }
}


mixin template EnabledBean(){
    private bool _enabled;
    
    @property boolean enabled(){
        return _enabled;
    }
    
    @property void enabled(bool newenabled){
        _enabled=newenabled;
    }
    
}

mixin template HierarchicalBean(T){
    
    private string _indexno;
    
    private T _parent;
    
    private T[] _children;
    
    @property string indexno(){
        return _indexno;
    }
    
    @property void indexno(string newindexno){
        _indexno = newindexno;
    }
    
    @property T parent(){
        return _parent;
    }
    
    @property void parent(T newParent){
        _parent = newParent;
    }
    
    @property T[] children(){
        return _children;
    }
    
    @property void children(T[] newChildren){
        _children=newChildren;
    }
}

import std.datetime;
mixin template TemporalAtBean(){
    
    private DateTime _beginAt;
    private DateTime _endAt;
    
    @property DateTime beginAt(){
        return _beginAt;
    }
    @property DateTime endAt(){
        return _endAt;
    }
    @property void beginAt(DateTime newBeginAt){
        _beginAt=newBeginAt;
    }
     @property void endAt(DateTime newEndAt){
        _endAt=newEndAt;
    }
}

class BaseCode(T):IdObject!T,TemporalAt{
    mixin TemporalAtBean;
}
