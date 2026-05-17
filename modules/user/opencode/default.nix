{ config, pkgs, ... }:

{
    programs.opencode = {
        enable = true;
        settings = {
			"$schema" = "https://opencode.ai/config.json";
			provider = {
				lmstudio = {
					models = {
						"qwen/qwen3.5-35b-a3b" = {
							name = "QWEN 3.5 (local)";
						};
					};
					name = "LM Studio (local)";
					npm = "@ai-sdk/openai-compatible";
					options = {
						baseURL = "http://10.8.0.6:1234/v1";
					};
				};
			};
        };
    };
}