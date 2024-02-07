<h1 align="center">
<a href='#'><img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/palette/macchiato.png" width="600px"/></a>
  <br>
  <br>
  <div>
    <a href="https://github.com/redyf/Neve/issues">
        <img src="https://img.shields.io/github/issues/redyf/Neve?color=fab387&labelColor=303446&style=for-the-badge">
    </a>
    <a href="https://github.com/redyf/Neve/stargazers">
        <img src="https://img.shields.io/github/stars/redyf/Neve?color=ca9ee6&labelColor=303446&style=for-the-badge">
    </a>
    <a href="https://github.com/redyf/Neve">
        <img src="https://img.shields.io/github/repo-size/redyf/Neve?color=ea999c&labelColor=303446&style=for-the-badge">
    </a>
    <a href="https://github.com/redyf/Neve/blob/main/.github/LICENCE">
        <img src="https://img.shields.io/static/v1.svg?style=for-the-badge&label=License&message=MIT&logoColor=ca9ee6&colorA=313244&colorB=cba6f7"/>
    </a>
    <br>
            <img href="https://builtwithnix.org" src="https://builtwithnix.org/badge.svg"/>
    </div>
   </h1>

<h1 align="center">❄️ Neve ❄️</h1>
<h3 align="center">

<details>
    <summary>Showcase</summary>

![Neve](https://cdn.discordapp.com/attachments/933711967217123411/1204637351066992740/image.png?ex=65d574f5&is=65c2fff5&hm=d9e45dd67ccc5b0f2a62e6215464f5849079ad6139d1187acdbb2ad3ab639916&)
![Neve2](https://cdn.discordapp.com/attachments/933711967217123411/1204637623679717426/image.png?ex=65d57536&is=65c30036&hm=9a8cdf58b7f8b5bf660829e7a08e0d3d090c34d06453d3a9f17123887af49d2f&)
![Neve3](https://cdn.discordapp.com/attachments/933711967217123411/1204637960369213450/image.png?ex=65d57586&is=65c30086&hm=96ab84f41879b0660964ff92d8d099d83c0f319291bc391d55d011bf141510f1&)
![Neve4](https://cdn.discordapp.com/attachments/933711967217123411/1204638486066368512/image.png?ex=65d57604&is=65c30104&hm=fbbfbf43e8245e37585b4a4c8b7a4f3298845726720fbc1c77c024e52d576e87&)
![Neve5](https://cdn.discordapp.com/attachments/933711967217123411/1204638725833883728/image.png?ex=65d5763d&is=65c3013d&hm=31898ca3921d23b907ef798296e0a0a4283b1cf3f2e357e43bb5fe91c1d51005&)
![Neve6](https://cdn.discordapp.com/attachments/933711967217123411/1204640737065435146/image.png?ex=65d5781c&is=65c3031c&hm=8149a13584c880d483e951ec275e174c05716dea62dade6962317b3756be7c71&)

</details>

</h3>

## What's Neve??

Neve (snow in portuguese) is a meticulously crafted custom configuration for Nixvim, designed to revolutionize your development workflow and provide an unparalleled coding experience. This configuration is the culmination of expertise and passion, aiming to provide sane defaults.

## Features

- **Powerful Development Environment:** Neve is tailored to deliver a robust and efficient development environment. With carefully selected plugins, optimized settings, and thoughtful customization, it ensures that your coding journey is both smooth and productive.

- **Nixvim Integration:** Built on the foundation of Nixvim, Neve seamlessly integrates with the powerful Nix package manager. This integration not only simplifies the setup process but also guarantees a consistent and reproducible development environment across different machines.

- **Thoughtful Customization:** Neve doesn't just stop at default settings. It's designed to be easily customizable, allowing you to tailor your Nixvim experience to match your unique preferences and workflow.

- **Extensive Plugin Support:** Benefit from a curated selection of plugins that cover a wide range of programming languages and development tasks. Neve comes with pre-configured plugins to boost your productivity, and you can effortlessly expand its capabilities to suit your specific needs.

## Installation

Getting started with Neve is a breeze. Simply follow the installation guide below, and you'll be up and running in no time.

However if you'd like to give it a try before installing, <b>nix run github:redyf/neve</b> is available!

<details>
    <summary><b>INSTALLATION GUIDE</b></summary>
    I'm assuming you already use nix flakes but in case you don't, please check this tutorial to enable them:

[Flakes](https://nixos.wiki/wiki/Flakes)

    After enabling it, follow the steps below:

```
1- Go to flake.nix and add Neve.url = "github:redyf/Neve" to your inputs.

2- Run nix flake update, then Neve should be available for installation.

3- Install it by adding inputs.Neve.packages.${system}.default to your environment.systemPackages or home.packages if you're using home-manager.

4- Rebuild your system and you should be done :
```

</details>

## Quick Start

Neve is highly customizable. Here are some important files for configuring your environment:

- **config/default.nix:** This file contains the main configuration file. You can add or delete plugins as you like.

- **config/sets.nix:** In this file, you can add or remove options and adjust their specific settings.

- **config/keymaps.nix:** This file contains custom key mappings. You can add your own keyboard shortcuts to enhance productivity.

- **config/lsp/lsp.nix:** Here you can configure your preferred Language Servers.

- **config/lsp/conform.nix:** Configure Formatters for the desired languages.

- **config/languages/nvim-lint.nix:** Set up linters for specific languages.

## Contribution

Contributions are welcome! Feel free to [open an issue](https://github.com/redyf/Neve/issues) to report problems, suggest improvements, or submit pull requests to add new features to Neve.

## License

This project is licensed under the [MIT License](LICENCE). See the LICENSE file for more details.

## Support

Encountered an issue or have a question? Visit our [Issue Tracker](https://github.com/redyf/Neve/issues) or message me on Discord, my username is **redyf**.

Happy coding!
