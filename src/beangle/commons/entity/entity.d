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
Data entity interfaces include $(B Entity),$(B Enabled),$(B Updated),
$(B TemporalAt),$(B TemporalOn) and ,$(B Hierarchical).
*/
module beangle.commons.entity.entity;

/**
 * Data Entity interface
 */
interface Entity(T){
  
  @property T id();
  
  @property final bool persisted(){
      return id!=T.init;
  }
  
  final bool opEquals(Entity other){
      if(this is other) return true;
      if(T.init == id && T.init ==other.id) return false;
      return id == other.id;
  }
  
  final size_t toHash(){
       static if(is(T:ushort)){
           return id;
       }else static if(is(T:uint)){
           return id;
       }else static if(is(T:ulong)){
           return cast(size_t)(id ^ (id>>>32));
       }else static if(is(T:string)){
           int h=0;
           foreach (c;id) h = 31 * h + c;
           return h;
       }else{
           return id.toHash();
       }
  }
}

/**
 * Entity has enabled or disabled state.
 */
interface Enabled{
    @property bool enabled();
}

import std.datetime;
import std.typecons;

/**
 * Entity contains create and update time.
 */
interface Updated{
    @property DateTime createdAt();
    @property DateTime updatedAt();
}

/**
 * Temporal entity has beginAt/endAt(opt).
 */
interface TemporalAt{
    @property DateTime beginAt();
    @property DateTime endAt();
}

/**
 * Temporal entity has beginOn/endOn(opt).
 */
interface TemporalOn{
    @property Date beginOn();
    @property Date endOn();
}

/**
 * Coded entity interface
 */
interface Coded {
    @property string code();
}

/**
 * entity with a name.
 */
interface Named {
    @property string name();
}

/**
 * Hierarchical entity.
 */
interface Hierarchical(T){
    
  @property string indexno();

  @property T parent();

  @property T[] children();
}
