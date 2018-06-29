# stanwoodtask

My attempt at the Stanwood tech task that will hopefully land me a job!

## Architecture

The app is written in Swift 4.2 using the MVVM architecture. This was chosen for easy re-use of view controllers by being able to swap out the underlying datasources to accomodate both scenarios the screens are used for. It also seperates out the functionality enough to make testing easier. I've used Protocols and POP where I can. All classes are also under 100 lines of code each which would make testing much more granular. 

## Things I didn't implement

I believe the only thing that is missing is the Search functionality for major bonus points and UI improvements. Main reason for the search was time spent on the project. I've also used a lot of newer technologies in this project (Codable and CodingKeys, CachedURLResponse) which took me more time to get my head around and I felt these were more important to get correct. I used a UICollectionView which does give a different layout experience on iPad and I felt this was good enough.

## Thing's I'd do differently

I'd probably tidy up interaction between the view models and data source / delegate. I feel at times it can get confusing with the different ways I've handled interaction (closures, delegates) and I would've stuck to just one preferred pattern. However I also feels this shows off more of what I can do and understand and that I'm comfortable using both methods. I would've liked to have used more structs than classes for the view models but I wasn't sure on how to handle a couple of things (mainly mutating self in the closures) and I couldn't find a way around it without changing the architecture so I've used structs and more modern swift where I can. I didn't use CoreData for the favourites as I felt it was a bit overkill for the small of amount of data that would be used however, if I'd have had more time on the task, I probably would've done this just to show off that I can. 

## Thing's I've learnt

I enjoyed the task and it gave me a chance to explore newer things which I don't always get to use in my day to day work (most networking in my current role is still Obj-C so I haven't had the chance to experience Codable). I feel I've got my head around it and even if my application isn't successful, at least I've learnt some newer ways of doing things! I feel the test is a great test of planning and architecture as it would be very easy to write a lot of duplicate code for this task. Hopefully I've kept this down to a minimum! 
