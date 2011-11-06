#ifndef MUSIC_ELEMENTS_H_
#define MUSIC_ELEMENTS_H_

#include <list>

namespace music {


	typedef unsigned int element_id_t;

	/*! Abstract base class from which all music elements derive */
	class MusicElement {
		protected:
			element_id_t id;
			std::string text;

		public:
			MusicElement (std::string t) : text(t) { ++num_music_elements; }
			~MusicElement () { num_music_elements--; }

			static unsigned int num_music_elements;
			element_id_t ID () const { return id; }
	};


	/*! Interface for element containers */
	class IMusicElementList {
		public:
			typedef std::list<MusicElement> element_list;
			note_list::iterator elements_begin () const { return elements.begin(); }
			note_list::iterator elements_end () const { return elements.end(); }

		protected:
			element_list elements;
	};
			 

	class Measure : public IMusicElementList {
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

	class Tie : public MusicElement {
	};

	class Slur : public MusicElement {
	};

	typedef enum {
		SingleBar, DoubleBar, 
		RepeatBackBar, RepeatBackForwardBar, RepeatForwardBar
	} bar_t;

	class Bar : public MusicElement {
		protected:
			bar_t bartype;
		public:
			bar_t type () const { return bartype; }
	};

} // namespace music

#endif
