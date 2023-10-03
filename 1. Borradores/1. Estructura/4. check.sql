USE AtlasBooks


IF OBJECT_ID('CK_Book_rating') IS NOT NULL
	BEGIN
		ALTER TABLE Book
		DROP CK_Book_rating
	END
GO


ALTER TABLE Book
ADD CONSTRAINT CK_Book_rating
CHECK (rating BETWEEN 0 AND 10)