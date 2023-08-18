# Bloom Anti-Cheat (v0.3.0a)

## [Documentation](./docs/home.md)

## What is Bloom Anti-Cheat?

Bloom Anti-Cheat is a free, open-source anti-cheat for Roblox games. It is designed to be easy to use and easy to integrate into your game. It focuses on accuracy and performance, and is written in Luau with a bit of Rust for static analysis.

## How does it work?

Bloom Anti-Cheat uses many different client-side methods to detect cheating. The clients will detect the cheats of other players and send the data they collect to the server. The server will then use it's own data and what I call the "Voting System" to determine if the player is cheating or not. The server will then perform the appropriate action in order to punish the cheater. This ensures the server has very minimal performance impact as the clients can adapt to the devices they are running on individually for the best performance.

## How do I use it?

Bloom Anti-Cheat is made to be a very simple drag-and-drop solution. You can download the latest release and then drop the folders into the right places. From there, you would simply connect to the API so the anti-cheat can understand how YOUR game works. You can find more information on how to do that in the [documentation](./docs/home.md). 

## How can I contribute?

As the anti-cheat is still in the alpha phase, you can contribute by making an issue and reporting bugs or suggesting features. You can also contribute by making a pull request and adding your own features or fixing bugs, but it may take a while for me to review it so you should probably make an issue first. All development is done in the `development` branch, so make sure you are making your pull requests to that branch.

## How can I contact you?

Email me at <nickstienz@gmail.com> if you have any questions or concerns.

Matrix (Bloom): [#bloom-anti-cheat:matrix.org](https://matrix.to/#/#bloom-anti-cheat:matrix.org)

Matrix (Nick): @nickstienz:matrix.org
