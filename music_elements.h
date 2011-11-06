#ifndef MUSIC_ELEMENTS_H_
#define MUSIC_ELEMENTS_H_

#include <list>

namespace music {


	typedef unsigned int element_id_t;

	/*! Abstract base class from which all music elements derive */
	class MusicElement {
		protected:
			element_id_t id;
		public:
			element_id_t ID () const { return id; }
	};

	/// Interface for elements that involve multiple notes
	class INoteList {
		public:
			typedef std::list<Note> note_list;
			note_list::iterator notes_begin () const { return notes.begin(); }
			note_list::iterator notes_end () const { return notes.end(); }

		protected:
			note_list notes;
	};
			 

	class Note : public MusicElement {
		protected:
			unsigned int pitch;
			unsigned int duration;
	};

	class Rest : public MusicElement {
		protected:
			unsigned int duration;
	};

	class Tie : public MusicElement, public INoteList {
	};

	class Slur : public MusicElement, public INoteList {
	};

} // namespace music

#endif
