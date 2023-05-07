create schema `open-reads`;

use `open-reads`;

create table book
(
    id             bigint auto_increment
        primary key,
    author         varchar(255)   null,
    cover_imageurl varchar(255)   null,
    description    varchar(10000) null,
    genre          smallint       null,
    name           varchar(255)   null
);

create table `open-reads`.open_reads_user
(
    id                     varchar(255) not null
        primary key,
    description            varchar(255) null,
    friends_list           varchar(255) null,
    last_action_time_stamp bigint       null,
    name                   varchar(255) null,
    profile_imageurl       varchar(255) null,
    username               varchar(255) null
);


INSERT INTO `open-reads`.open_reads_user (id, description, friends_list, last_action_time_stamp, name, profile_imageurl, username) VALUES ('4217092d-9133-41a5-83db-e52079a98391', 'This is the description for the demo user.', 'demo,', 1682953699326, null, 'https://avatars.githubusercontent.com/u/35799602?v=4', 'rusu');
INSERT INTO `open-reads`.open_reads_user (id, description, friends_list, last_action_time_stamp, name, profile_imageurl, username) VALUES ('bfebd3f5-95f5-4656-bc8b-d1571da48df8', 'This is the description for the admin user.', 'rusu,', 1682953561867, null, 'https://avatars.githubusercontent.com/u/92299329?v=4', 'demo');




INSERT INTO `open-reads`.book (id, author, cover_imageurl, description, genre, name) VALUES (1, 'Gayle Laakmann McDowell', 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1391311964i/12544648.jpg', 'Now in the 5th edition, Cracking the Coding Interview gives you the interview preparation you need to get the top software developer jobs. This is a deeply technical book and focuses on the software engineering skills to ace your interview. The book is over 500 pages and includes 150 programming interview questions and answers, as well as other advice.', 0, 'Cracking the Coding Interview: 150 Programming Questions and Solutions');
INSERT INTO `open-reads`.book (id, author, cover_imageurl, description, genre, name) VALUES (2, 'Andy Hunt', 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1401432508i/4099.jpg', 'Straight from the programming trenches, The Pragmatic Programmer cuts through the increasing specialization and technicalities of modern software development to examine the core process--taking a requirement and producing working, maintainable code that delights its users. It covers topics ranging from personal responsibility and career development to architectural techniques for keeping your code flexible and easy to adapt and reuse. Read this book, and you\'ll learn how to Fight software rot; Avoid the trap of duplicating knowledge; Write flexible, dynamic, and adaptable code; Avoid programming by coincidence; Bullet-proof your code with contracts, assertions, and exceptions; Capture real requirements; Test ruthlessly and effectively; Delight your users; Build teams of pragmatic programmers; and Make your developments more precise with automation. Written as a series of self-contained sections and filled with entertaining anecdotes, thoughtful examples, and interesting analogies, The Pragmatic Programmer illustrates the best practices and major pitfalls of many different aspects of software development. Whether you"re a new coder, an experienced programmer, or a manager responsible for software projects, use these lessons daily, and you"ll quickly see improvements in personal productivity, accuracy, and job satisfaction. You\'ll learn skills and develop habits and attitudes that form the foundation for long-term success in your career. You"ll become a Pragmatic Programmer.', 0, 'The pragmatic programmer');
INSERT INTO `open-reads`.book (id, author, cover_imageurl, description, genre, name) VALUES (3, 'Robert C. Martin Series', 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1436202607i/3735293.jpg', 'Even bad code can function. But if code isn\'t clean, it can bring a development organization to its knees. Every year, countless hours and significant resources are lost because of poorly written code. But it doesn\'t have to be that way.
Noted software expert Robert C. Martin presents a revolutionary paradigm with Clean Code: A Handbook of Agile Software Craftsmanship . Martin has teamed up with his colleagues from Object Mentor to distill their best agile practice of cleaning code on the fly into a book that will instill within you the values of a software craftsman and make you a better programmer but only if you work at it. What kind of work will you be doing? You\'ll be reading code - lots of code. And you will be challenged to think about what\'s right about that code, and whats wrong with it. More importantly, you will be challenged to reassess your professional values and your commitment to your craft.
Clean Code is divided into three parts. The first describes the principles, patterns, and practices of writing clean code. The second part consists of several case studies of increasing complexity. Each case study is an exercise in cleaning up code - of transforming a code base that has some problems into one that is sound and efficient. The third part is the payoff: a single chapter containing a list of heuristics and "smells" gathered while creating the case studies. The result is a knowledge base that describes the way we think when we write, read, and clean code.', 0, 'Test Book');
INSERT INTO `open-reads`.book (id, author, cover_imageurl, description, genre, name) VALUES (4, 'Steve McConnell', 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1396837641i/4845.jpg', 'Widely considered one of the best practical guides to programming, Steve McConnell’s original code complete has been helping developers write better software for more than a decade. Now this classic book has been fully updated and revised with leading-edge practices—and hundreds of new code samples—illustrating the art and science of software construction. Capturing the body of knowledge available from research, academia, and everyday commercial practice, McConnell synthesizes the most effective techniques and must-know principles into clear, pragmatic guidance. No matter what your experience level, development environment, or project size, this book will inform and stimulate your thinking—and help you build the highest quality code.
Discover the timeless techniques and strategies that help you.', 0, 'Code Complete');
INSERT INTO `open-reads`.book (id, author, cover_imageurl, description, genre, name) VALUES (5, 'Erich Gamma', 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1348027904i/85009.jpg', 'Capturing a wealth of experience about the design of object-oriented software, four top-notch designers present a catalog of simple and succinct solutions to commonly occurring design problems. Previously undocumented, these 23 patterns allow designers to create more flexible, elegant, and ultimately reusable designs without having to rediscover the design solutions themselves. The authors begin by describing what patterns are and how they can help you design object-oriented software. They then go on to systematically name, explain, evaluate, and catalog recurring designs in object-oriented systems. With Design Patterns as your guide, you will learn how these important patterns fit into the software development process, and how you can leverage them to solve your own design problems most efficiently. Each pattern describes the circumstances in which it is applicable, when it can be applied in view of other design constraints, and the consequences and trade-offs of using the pattern within a larger design. All patterns are compiled from real systems and are based on real-world examples. Each pattern also includes code that demonstrates how it may be implemented in object-oriented programming languages like C++ or Smalltalk.', 0, 'Design Patterns: Elements of Reusable Object-Oriented Software');
INSERT INTO `open-reads`.book (id, author, cover_imageurl, description, genre, name) VALUES (6, 'Martin Fowler', 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1386925632i/44936.jpg', 'As the application of object technology—particularly the Java programming language—has become commonplace, a new problem has emerged to confront the software development community. Significant numbers of poorly designed programs have been created by less-experienced developers, resulting in applications that are inefficient and hard to maintain and extend. Increasingly, software system professionals are discovering just how difficult it is to work with these inherited, non-optimal applications. For several years, expert-level object programmers have employed a growing collection of techniques to improve the structural integrity and performance of such existing software programs. Referred to as refactoring, these practices have remained in the domain of experts because no attempt has been made to transcribe the lore into a form that all developers could use... until now. In Refactoring: Improving the Design of Existing Software, renowned object technology mentor Martin Fowler breaks new ground, demystifying these master practices and demonstrating how software practitioners can realize the significant benefits of this new process.', 0, 'Refactoring: Improving the Design of Existing Code');
INSERT INTO `open-reads`.book (id, author, cover_imageurl, description, genre, name) VALUES (7, 'Frederick P. Brooks Jr.', 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1348430512i/13629.jpg', 'Few books on software project management have been as influential and timeless as The Mythical Man-Month. With a blend of software engineering facts and thought-provoking opinions, Fred Brooks offers insight for anyone managing complex projects. These essays draw from his experience as project manager for the IBM System/360 computer family and then for OS/360, its massive software system. Now, 45 years after the initial publication of his book, Brooks has revisited his original ideas and added new thoughts and advice, both for readers already familiar with his work and for readers discovering it for the first time.', 0, 'The Mythical Man-Month: Essays on Software Engineering');
INSERT INTO `open-reads`.book (id, author, cover_imageurl, description, genre, name) VALUES (8, 'Harold Abelson', 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1391032527i/43713.jpg', 'Rate this book
Structure and Interpretation of Computer Programs has had a dramatic impact on computer science curricula over the past decade. This long-awaited revision contains changes throughout the text. There are new implementations of most of the major programming systems in the book, including the interpreters and compilers, and the authors have incorporated many small changes that reflect their experience teaching the course at MIT since the first edition was published. A new theme has been introduced that emphasizes the central role played by different approaches to dealing with time in computational models: objects with state, concurrent programming, functional programming and lazy evaluation, and nondeterministic programming. There are new example sections on higher-order procedures in graphics and on applications of stream processing in numerical programming, and many new exercises. In addition, all the programs have been reworked to run in any Scheme implementation that adheres to the IEEE standard.', 0, 'Structure and Interpretation of Computer Programs');
INSERT INTO `open-reads`.book (id, author, cover_imageurl, description, genre, name) VALUES (9, 'Elisabeth Freeman', 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1408309444i/58128.jpg', 'At any given moment, somewhere in the world someone struggles with the same software design problems you have. You know you don\'t want to reinvent the wheel (or worse, a flat tire), so you look to Design Patterns--the lessons learned by those who\'ve faced the same problems. With Design Patterns, you get to take advantage of the best practices and experience of others, so that you can spend your time on...something else. Something more challenging. Something more complex. Something more fun. You want to learn about the patterns that matter--why to use them, when to use them, how to use them (and when NOT to use them). But you don\'t just want to see how patterns look in a book, you want to know how they look "in the wild". In their native environment. In other words, in real world applications. You also want to learn how patterns are used in the Java API, and how to exploit Java\'s built-in pattern support in your own code. You want to learn the real OO design principles and why everything your boss told you about inheritance might be wrong (and what to do instead). You want to learn how those principles will help the next time you\'re up a creek without a design pattern. Most importantly, you want to learn the "secret language" of Design Patterns so that you can hold your own with your co-worker (and impress cocktail party guests) when he casually mentions his stunningly clever use of Command, Facade, Proxy, and Factory in between sips of a martini. You\'ll easily counter with your deep understanding of why Singleton isn\'t as simple as it sounds, how the Factory is so often misunderstood, or on the real relationship between Decorator, Facade and Adapter.', 0, 'Head First Design Patterns');
INSERT INTO `open-reads`.book (id, author, cover_imageurl, description, genre, name) VALUES (10, 'Brian W. Kernighan', 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1391032531i/515601.jpg', 'This book is meant to help the reader learn how to program in C. It is the definitive reference guide, now in a second edition. Although the first edition was written in 1978, it continues to be a worldwide best-seller. This second edition brings the classic original up to date to include the ANSI standard. ', 0, 'The C Programming Language');
INSERT INTO `open-reads`.book (id, author, cover_imageurl, description, genre, name) VALUES (11, 'Thomas H. Cormen', 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1387741681i/108986.jpg', 'A comprehensive update of the leading algorithms text, with new material on matchings in bipartite graphs, online algorithms, machine learning, and other topics. Some books on algorithms are rigorous but incomplete; others cover masses of material but lack rigor. Introduction to Algorithms uniquely combines rigor and comprehensiveness. It covers a broad range of algorithms in depth, yet makes their design and analysis accessible to all levels of readers, with self-contained chapters and algorithms in pseudocode. Since the publication of the first edition, Introduction to Algorithms has become the leading algorithms text in universities worldwide as well as the standard reference for professionals. This fourth edition has been updated throughout.', 0, 'Introduction to Algorithms');
INSERT INTO `open-reads`.book (id, author, cover_imageurl, description, genre, name) VALUES (12, 'Douglas Crockford', 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1328834793i/2998152.jpg', 'Most programming languages contain good and bad parts, but JavaScript has more than its share of the bad, having been developed and released in a hurry before it could be refined. This authoritative book scrapes away these bad features to reveal a subset of JavaScript that\'s more reliable, readable, and maintainable than the language as a whole—a subset you can use to create truly extensible and efficient code. Considered the JavaScript expert by many people in the development community, author Douglas Crockford identifies the abundance of good ideas that make JavaScript an outstanding object-oriented programming language-ideas such as functions, loose typing, dynamic objects, and an expressive object literal notation. Unfortunately, these good ideas are mixed in with bad and downright awful ideas, like a programming model based on global variables. When Java applets failed, JavaScript became the language of the Web by default, making its popularity almost completely independent of its qualities as a programming language. In JavaScript: The Good Parts , Crockford finally digs through the steaming pile of good intentions and blunders to give you a detailed look at all the genuinely elegant parts of JavaScript, including: The real beauty? As you move ahead with the subset of JavaScript that this book presents, you\'ll also sidestep the need to unlearn all the bad parts. Of course, if you want to find out more about the bad parts and how to use them badly, simply consult any other JavaScript book. With JavaScript: The Good Parts , you\'ll discover a beautiful, elegant, lightweight and highly expressive language that lets you create effective code, whether you\'re managing object libraries or just trying to get Ajax to run fast. If you develop sites or applications for the Web, this book is an absolute must.', 0, 'JavaScript: The Good Parts');
INSERT INTO `open-reads`.book (id, author, cover_imageurl, description, genre, name) VALUES (13, 'Michael C. Feathers', 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1348627451i/44919.jpg', 'Get more out of your legacy systems, more performance, functionality, reliability, and manageability.Is your code easy to change? Can you get nearly instantaneous feedback when you do change it? Do you understand it? If the answer to any of these questions is no, you have legacy code, and it is draining time and money away from your development efforts. In this book, Michael Feathers offers start-to-finish strategies for working more effectively with large, untested legacy code bases. This book draws on material Michael created for his renowned Object Mentor seminars, techniques Michael has used in mentoring to help hundreds of developers, technical managers, and testers bring their legacy systems under control. ', 0, 'Working Effectively with Legacy Code');
INSERT INTO `open-reads`.book (id, author, cover_imageurl, description, genre, name) VALUES (14, 'Charles Petzold', 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1328830222i/44882.jpg', 'What do flashlights, the British invasion, black cats, and seesaws have to do with computers? In CODE, they show us the ingenious ways we manipulate language and invent new means of communicating with each other. And through CODE, we see how this ingenuity and our very human compulsion to communicate have driven the technological innovations of the past two centuries. Using everyday objects and familiar language systems such as Braille and Morse code, author Charles Petzold weaves an illuminating narrative for anyone who’s ever wondered about the secret inner life of computers and other smart machines.It’s a cleverly illustrated and eminently comprehensible story—and along the way, you’ll discover you’ve gained a real context for understanding today’s world of PCs, digital media, and the Internet. No matter what your level of technical savvy, CODE will charm you—and perhaps even awaken the technophile within.', 0, 'Code: The Hidden Language of Computer Hardware and Software');
INSERT INTO `open-reads`.book (id, author, cover_imageurl, description, genre, name) VALUES (15, 'Joshua Bloch', 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1513389229i/34927404.jpg', 'Since this Jolt-award winning classic was last updated in 2008 (shortly after Java 6 was released), Java has changed dramatically. The principal enhancement in Java 8 was the addition of functional programming constructs to Java\'s object-oriented roots. Java 7, 8, and 9 also introduced language features, such as the try-with-resources statement, the diamond operator for generic types, default and static methods in interfaces, the @SafeVarargs annotation, and modules. New library features include pervasive use of functional interfaces and streams, the java.time package for manipulating dates and times, and numerous minor enhancements such as convenience factory methods for collections. In this new edition of Effective Java, Bloch updates the work to take advantage of these new language and library features, and provides specific best practices for their use. Java\'s increased support for multiple paradigms increases the need for best-practices advice, and this book delivers. ', 0, 'Effective Java');

create table `open-reads`.open_reads_user_currently_reading
(
    user_id              varchar(255) not null,
    currently_reading_id bigint       not null,
    constraint UK_4clivwtpt6ljgbwm1utfbsdqh
        unique (currently_reading_id),
    constraint FK9a9ytp0crmf55uba3o22d3ff1
        foreign key (currently_reading_id) references `open-reads`.book (id),
    constraint FKpuesm9svcgwp6g6ti7fnp0qhc
        foreign key (user_id) references `open-reads`.open_reads_user (id)
);

create table `open-reads`.open_reads_user_read
(
    user_id varchar(255) not null,
    read_id bigint       not null,
    constraint UK_68o28o6t2gujfppmybm0nqgyy
        unique (read_id),
    constraint FK43vof6dh1hhkvb2wxvth0m5im
        foreign key (read_id) references `open-reads`.book (id),
    constraint FKgct5qnu3w87putce0ksht4k9h
        foreign key (user_id) references `open-reads`.open_reads_user (id)
);

create table `open-reads`.open_reads_user_want_to_read
(
    user_id         varchar(255) not null,
    want_to_read_id bigint       not null,
    constraint UK_rs5n4vwrjm4dd3g15uncyftcr
        unique (want_to_read_id),
    constraint FKg6scpxlsw7b390e1hkc7ms7kw
        foreign key (user_id) references `open-reads`.open_reads_user (id),
    constraint FKjg7nald3kufg8jcyanrquxsre
        foreign key (want_to_read_id) references `open-reads`.book (id)
);

INSERT INTO `open-reads`.open_reads_user_currently_reading (user_id, currently_reading_id) VALUES ('4217092d-9133-41a5-83db-e52079a98391', 12);
INSERT INTO `open-reads`.open_reads_user_currently_reading (user_id, currently_reading_id) VALUES ('bfebd3f5-95f5-4656-bc8b-d1571da48df8', 2);


INSERT INTO `open-reads`.open_reads_user_read (user_id, read_id) VALUES ('4217092d-9133-41a5-83db-e52079a98391', 14);
INSERT INTO `open-reads`.open_reads_user_read (user_id, read_id) VALUES ('bfebd3f5-95f5-4656-bc8b-d1571da48df8', 1);
INSERT INTO `open-reads`.open_reads_user_read (user_id, read_id) VALUES ('bfebd3f5-95f5-4656-bc8b-d1571da48df8', 10);


INSERT INTO `open-reads`.open_reads_user_want_to_read (user_id, want_to_read_id) VALUES ('4217092d-9133-41a5-83db-e52079a98391', 2);
INSERT INTO `open-reads`.open_reads_user_want_to_read (user_id, want_to_read_id) VALUES ('bfebd3f5-95f5-4656-bc8b-d1571da48df8', 8);

create table `open-reads`.review
(
    id      bigint auto_increment
        primary key,
    comment varchar(255) null,
    rating  double       null,
    book_id bigint       null,
    user_id varchar(255) null,
    constraint FK70yrt09r4r54tcgkrwbeqenbs
        foreign key (book_id) references `open-reads`.book (id),
    constraint FKpg5dg1cydnjc17unds9k3sf9m
        foreign key (user_id) references `open-reads`.open_reads_user (id)
);


INSERT INTO `open-reads`.review (id, comment, rating, book_id, user_id) VALUES (1, null, 5.0, 1, 'bfebd3f5-95f5-4656-bc8b-d1571da48df8');
INSERT INTO `open-reads`.review (id, comment, rating, book_id, user_id) VALUES (2, null, 4.0, 2, 'bfebd3f5-95f5-4656-bc8b-d1571da48df8');
INSERT INTO `open-reads`.review (id, comment, rating, book_id, user_id) VALUES (3, null, 2.0, 3, 'bfebd3f5-95f5-4656-bc8b-d1571da48df8');


