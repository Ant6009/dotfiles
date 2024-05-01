-- https://github.com/huggingface/llm.nvim#readme
return {
  {
    "huggingface/llm.nvim",
    opts = {
      tokens_to_clear = { "<|endoftext|>" },
      fim = {
        enabled = true,
        prefix = "<fim_prefix>",
        middle = "<fim_middle>",
        suffix = "<fim_suffix>",
      },
      model = "bigcode/starcoder",
      context_window = 8192,
      enabled = false,
      tokenizer = {
        repository = "bigcode/starcoder",
      }
    },
  },
}
