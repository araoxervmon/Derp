
CREATE TABLE IF NOT EXISTS `derpmembers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `derpname` varchar(20) NOT NULL,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `regdate` date NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (derpname) REFERENCES derpuser(user)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `derpmembers` (`id`, `derpname`, `name`, `email`, `regdate`) VALUES
(1, 'admin', 'Akhil', 'akhil@csu.fullerton.edu', '2014-09-30'),
(2, 'admin', 'Praveen', 'praveeninfotech@gmail.com', '2014-10-01'),
(3, 'admin', 'sameer', 'sameer@csu.fullerton.com', '2014-09-30'),
(4, 'admin', 'Abhishek', 'abhishekkoulgi@gmail.com', '2014-10-01');


CREATE TABLE IF NOT EXISTS `derpuser` (
  `user` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(44) NOT NULL,
  `regdate` date NOT NULL,
  PRIMARY KEY (user)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `derpuser` (`user`, `password`, `email`, `regdate`) VALUES
('abhilash', 'abhilash', 'abhilash.rao0@gmail.com', '2014-10-06'),
('admin', 'passw0rd', 'arao@javascript.com', '2014-10-01');
