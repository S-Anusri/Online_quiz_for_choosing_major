This work presents a framework for guiding students in making a decision about their college majors and minors by considering the principles outlined in NEP 2020. This framework
is aimed to provide students with a structured approach which encourages them to consider their interests, abilities and career prospects without any bias and suggests the suitable majors and minors which can be considered.

The framework can be considered as a solution which helps people decide on an area of study and suggests potential majors and minors by considering diverse factors such as their personality, interests, expectations for the career and future, etc.
A visual representation of the key components of the framework:

<img width="304" alt="image" src="https://github.com/user-attachments/assets/c750898a-b904-422a-9cf0-9638124be241" />
<img width="275" alt="image" src="https://github.com/user-attachments/assets/f1485101-264b-469d-b47e-70a7fda45ee9" />

**Personality Questions:** These questions help in determining the specific buckets of subjects to which
the participant is best suited to. The questions are based
on the analysis of a conducted survey, where a google form was circulated to collect information from students in various colleges regarding their reasons and motives for pursuing their current majors. Personality questions have 6 options each, which directly map to one of the buckets present in the framework, i.e., when the participant chooses a specific option for a
personality question, then the bucket to which the selected option is linked to gets “one” point.

**Major Bucket Deciding Questions:** These questions are determined based on the analysis of options chosen for the Personality questions. The questions in this category vary based on the bucket selected by personality questions, and the number of options of each question of this category are the same as the number of subjects pertaining to that bucket.

**Minor Bucket Deciding Questions:** This category of questions is chosen in a similar way to that of the Major Bucket Deciding Questions.

<img width="308" alt="image" src="https://github.com/user-attachments/assets/8f2e1865-8d6f-4224-9d4d-4ca06601db65" />

UI of the Quiz Platform appears as:

<img width="469" alt="image" src="https://github.com/user-attachments/assets/adc9e85c-1b8e-4ecb-a573-2e15715bb5fc" />
<img width="478" alt="image" src="https://github.com/user-attachments/assets/ab528fe1-3073-460c-a1f9-87b7a6b26bbc" />

**Overview of the Implementation of the framework:**
The web application, developed using the LAMP stack (Linux, Apache, MySQL, PHP), integrates HTML, CSS, JavaScript, JSP, Servlets, and Ajax to create an interactive quiz-based portal. A MySQL database ("majorminor") stores user registrations, questions, responses, and subject mappings. The application assigns unique session IDs to users for a 30-minute session. The quiz begins with eight fixed personality questions, after which responses are analyzed to determine Major and Minor Buckets using a servlet-based logic. Users then answer 12 additional questions per bucket, leading to a prioritized list of suitable subjects. They can explore colleges, faculty, and alumni contacts, with Ajax ensuring seamless question transitions and reduced redirections. The consistent UI design is maintained through header.jsp and footer.jsp, ensuring a structured and user-friendly experience.

The Annexure document can be referred for more information on how the questions were structured and the logical flow of how the quiz questions were implemented.

**REFERENCES**
1. NEP 2020 (National Education Policy 2020)
2. NEP 2020 (DRAFT Curricular Framework and Credit System for the Four-Year
Undergraduate Programme 1.0. Introduction The National Education)
3. College Major Quiz (https://www.thoughtco.com/college-major-quiz-4089204)
4. Which College Major should you be?
(https://brainfall.com/quizzes/which-college-major-should-you-be/)
5. Google form survey questionnaire
(https://docs.google.com/forms/d/1aHugHLfz5EYKtim1qoqHdTH0jkaHhQo7-HWi
7Y2IBPc/edit)






