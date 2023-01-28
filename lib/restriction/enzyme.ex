# DO NOT MODIFY THIS FILE DIRECTLY
# This module is generated using `mix bio.restriction.build`
# Or with `mix bio.restriction.update`
# Data herein is derived from the REBASE database monthly data files:
# http://rebase.neb.com/rebase/rebase.files.html

defmodule Bio.Restriction.Enzyme do
  @moduledoc """
  This module houses all of the functions for accessing a struct
  of restriction enzyme data, the `%Bio.Restriction.Enzyme`.

  All functions are the name of the enzyme in lowercase, where any `-`
  characters have been made `_`. By example, "BsmBI" would be `bsmbi` or
  "CviKI-1" would become `cviki_1`.
  """

  @doc """
  Get an enzyme struct by name, where name is either a binary or atom and
  case insensitive.
  """
  def get(name) when is_atom(name) do
    name
    |> Atom.to_string()
    |> get_struct()
  end

  def get(name) when is_binary(name) do
    get_struct(name)
  end

  defp get_struct(name) do
    func_name =
      name
      |> String.downcase()
      |> String.replace("-", "_")

    try do
      apply(__MODULE__, String.to_atom(func_name), [])
    rescue
      _ in UndefinedFunctionError -> raise "Unknown restriction enzyme #{func_name}"
    end
  end

  @doc """
  The primary struct for interacting with restriction enzymes
  """
  defstruct blunt?: nil, cut_1: 0, cut_2: 0, cut_3: 0, cut_4: 0, name: "", pattern: ""
  @doc false
  def aani do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "AanI",
      pattern: "ttataa"
    }
  end

  @doc false
  def aari do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 11,
      cut_2: 15,
      cut_3: 0,
      cut_4: 0,
      name: "AarI",
      pattern: "cacctgc"
    }
  end

  @doc false
  def aasi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 7,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "AasI",
      pattern: "gacnnnnnngtc"
    }
  end

  @doc false
  def aatii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 5,
      cut_2: 1,
      cut_3: 0,
      cut_4: 0,
      name: "AatII",
      pattern: "gacgtc"
    }
  end

  @doc false
  def aba6411ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Aba6411II",
      pattern: "crrtaag"
    }
  end

  @doc false
  def aba13301i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Aba13301I",
      pattern: "gcaaac"
    }
  end

  @doc false
  def abab8342iv do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "AbaB8342IV",
      pattern: "cattag"
    }
  end

  @doc false
  def abaciii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "AbaCIII",
      pattern: "ctatcav"
    }
  end

  @doc false
  def abapba3ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "AbaPBA3II",
      pattern: "caygac"
    }
  end

  @doc false
  def abasi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 12,
      cut_2: 10,
      cut_3: 0,
      cut_4: 0,
      name: "AbaSI",
      pattern: "c"
    }
  end

  @doc false
  def abaumb2i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "AbaUMB2I",
      pattern: "yccgss"
    }
  end

  @doc false
  def abr4036ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Abr4036II",
      pattern: "grtygacc"
    }
  end

  @doc false
  def absi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 6,
      cut_3: 0,
      cut_4: 0,
      name: "AbsI",
      pattern: "cctcgagg"
    }
  end

  @doc false
  def acci do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "AccI",
      pattern: "gtmkac"
    }
  end

  @doc false
  def accii do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 2,
      cut_2: 2,
      cut_3: 0,
      cut_4: 0,
      name: "AccII",
      pattern: "cgcg"
    }
  end

  @doc false
  def acciii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "AccIII",
      pattern: "tccgga"
    }
  end

  @doc false
  def accix do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "AccIX",
      pattern: "gacrac"
    }
  end

  @doc false
  def accx do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "AccX",
      pattern: "ggarca"
    }
  end

  @doc false
  def acc16i do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "Acc16I",
      pattern: "tgcgca"
    }
  end

  @doc false
  def acc36i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 10,
      cut_2: 14,
      cut_3: 0,
      cut_4: 0,
      name: "Acc36I",
      pattern: "acctgc"
    }
  end

  @doc false
  def acc65i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "Acc65I",
      pattern: "ggtacc"
    }
  end

  @doc false
  def acc65v do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Acc65V",
      pattern: "gacgca"
    }
  end

  @doc false
  def accb1i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "AccB1I",
      pattern: "ggyrcc"
    }
  end

  @doc false
  def accb7i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 7,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "AccB7I",
      pattern: "ccannnnntgg"
    }
  end

  @doc false
  def accbsi do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "AccBSI",
      pattern: "ccgctc"
    }
  end

  @doc false
  def aceiii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 13,
      cut_2: 17,
      cut_3: 0,
      cut_4: 0,
      name: "AceIII",
      pattern: "cagctc"
    }
  end

  @doc false
  def acha6iii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "AchA6III",
      pattern: "agccag"
    }
  end

  @doc false
  def acii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "AciI",
      pattern: "ccgc"
    }
  end

  @doc false
  def acli do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "AclI",
      pattern: "aacgtt"
    }
  end

  @doc false
  def aclwi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 9,
      cut_2: 10,
      cut_3: 0,
      cut_4: 0,
      name: "AclWI",
      pattern: "ggatc"
    }
  end

  @doc false
  def acoi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "AcoI",
      pattern: "yggccr"
    }
  end

  @doc false
  def aco12261ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Aco12261II",
      pattern: "ccrgag"
    }
  end

  @doc false
  def acoy31ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "AcoY31II",
      pattern: "tagcrab"
    }
  end

  @doc false
  def acsi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "AcsI",
      pattern: "raatty"
    }
  end

  @doc false
  def acui do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 22,
      cut_2: 20,
      cut_3: 0,
      cut_4: 0,
      name: "AcuI",
      pattern: "ctgaag"
    }
  end

  @doc false
  def acvi do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "AcvI",
      pattern: "cacgtg"
    }
  end

  @doc false
  def acyi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "AcyI",
      pattern: "grcgyc"
    }
  end

  @doc false
  def adei do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 6,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "AdeI",
      pattern: "cacnnngtg"
    }
  end

  @doc false
  def adh6u21i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Adh6U21I",
      pattern: "gaancag"
    }
  end

  @doc false
  def afai do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 2,
      cut_2: 2,
      cut_3: 0,
      cut_4: 0,
      name: "AfaI",
      pattern: "gtac"
    }
  end

  @doc false
  def afei do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "AfeI",
      pattern: "agcgct"
    }
  end

  @doc false
  def afii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 7,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "AfiI",
      pattern: "ccnnnnnnngg"
    }
  end

  @doc false
  def aflii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "AflII",
      pattern: "cttaag"
    }
  end

  @doc false
  def afliii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "AflIII",
      pattern: "acrygt"
    }
  end

  @doc false
  def agei do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "AgeI",
      pattern: "accggt"
    }
  end

  @doc false
  def agsi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 3,
      cut_2: 2,
      cut_3: 0,
      cut_4: 0,
      name: "AgsI",
      pattern: "ttsaa"
    }
  end

  @doc false
  def ahaiii do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "AhaIII",
      pattern: "tttaaa"
    }
  end

  @doc false
  def ahdi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 6,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "AhdI",
      pattern: "gacnnnnngtc"
    }
  end

  @doc false
  def ahli do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "AhlI",
      pattern: "actagt"
    }
  end

  @doc false
  def ahyrbahi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "AhyRBAHI",
      pattern: "gcyygac"
    }
  end

  @doc false
  def ahyyl17i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "AhyYL17I",
      pattern: "yaamgag"
    }
  end

  @doc false
  def ajii do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "AjiI",
      pattern: "cacgtc"
    }
  end

  @doc false
  def ajni do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "AjnI",
      pattern: "ccwgg"
    }
  end

  @doc false
  def ajui do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -8,
      cut_2: -13,
      cut_3: 25,
      cut_4: 20,
      name: "AjuI",
      pattern: "gaannnnnnnttgg"
    }
  end

  @doc false
  def alei do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 5,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "AleI",
      pattern: "cacnnnngtg"
    }
  end

  @doc false
  def alfi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -11,
      cut_2: -13,
      cut_3: 24,
      cut_4: 22,
      name: "AlfI",
      pattern: "gcannnnnntgc"
    }
  end

  @doc false
  def aloi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -8,
      cut_2: -13,
      cut_3: 25,
      cut_4: 20,
      name: "AloI",
      pattern: "gaacnnnnnntcc"
    }
  end

  @doc false
  def alui do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 2,
      cut_2: 2,
      cut_3: 0,
      cut_4: 0,
      name: "AluI",
      pattern: "agct"
    }
  end

  @doc false
  def alubi do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 2,
      cut_2: 2,
      cut_3: 0,
      cut_4: 0,
      name: "AluBI",
      pattern: "agct"
    }
  end

  @doc false
  def alwi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 9,
      cut_2: 10,
      cut_3: 0,
      cut_4: 0,
      name: "AlwI",
      pattern: "ggatc"
    }
  end

  @doc false
  def alw21i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 5,
      cut_2: 1,
      cut_3: 0,
      cut_4: 0,
      name: "Alw21I",
      pattern: "gwgcwc"
    }
  end

  @doc false
  def alw26i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 6,
      cut_2: 10,
      cut_3: 0,
      cut_4: 0,
      name: "Alw26I",
      pattern: "gtctc"
    }
  end

  @doc false
  def alw44i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "Alw44I",
      pattern: "gtgcac"
    }
  end

  @doc false
  def alwfi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "AlwFI",
      pattern: "gaaaynnnnnrtg"
    }
  end

  @doc false
  def alwni do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 6,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "AlwNI",
      pattern: "cagnnnctg"
    }
  end

  @doc false
  def ama87i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "Ama87I",
      pattern: "cycgrg"
    }
  end

  @doc false
  def amacsi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 17,
      cut_2: 15,
      cut_3: 0,
      cut_4: 0,
      name: "AmaCSI",
      pattern: "gctcca"
    }
  end

  @doc false
  def aod1i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Aod1I",
      pattern: "gatcnac"
    }
  end

  @doc false
  def aor13hi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "Aor13HI",
      pattern: "tccgga"
    }
  end

  @doc false
  def aor51hi do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "Aor51HI",
      pattern: "agcgct"
    }
  end

  @doc false
  def aoxi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -1,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "AoxI",
      pattern: "ggcc"
    }
  end

  @doc false
  def apai do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 5,
      cut_2: 1,
      cut_3: 0,
      cut_4: 0,
      name: "ApaI",
      pattern: "gggccc"
    }
  end

  @doc false
  def apabi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 8,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "ApaBI",
      pattern: "gcannnnntgc"
    }
  end

  @doc false
  def apali do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "ApaLI",
      pattern: "gtgcac"
    }
  end

  @doc false
  def apeki do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "ApeKI",
      pattern: "gcwgc"
    }
  end

  @doc false
  def apoi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "ApoI",
      pattern: "raatty"
    }
  end

  @doc false
  def apypi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 26,
      cut_2: 24,
      cut_3: 0,
      cut_4: 0,
      name: "ApyPI",
      pattern: "atcgac"
    }
  end

  @doc false
  def aquii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 27,
      cut_2: 25,
      cut_3: 0,
      cut_4: 0,
      name: "AquII",
      pattern: "gccgnac"
    }
  end

  @doc false
  def aquiii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 26,
      cut_2: 24,
      cut_3: 0,
      cut_4: 0,
      name: "AquIII",
      pattern: "gaggag"
    }
  end

  @doc false
  def aquiv do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 26,
      cut_2: 24,
      cut_3: 0,
      cut_4: 0,
      name: "AquIV",
      pattern: "grggaag"
    }
  end

  @doc false
  def arsi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -9,
      cut_2: -14,
      cut_3: 24,
      cut_4: 19,
      name: "ArsI",
      pattern: "gacnnnnnnttyg"
    }
  end

  @doc false
  def asci do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 6,
      cut_3: 0,
      cut_4: 0,
      name: "AscI",
      pattern: "ggcgcgcc"
    }
  end

  @doc false
  def asei do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "AseI",
      pattern: "attaat"
    }
  end

  @doc false
  def asi256i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "Asi256I",
      pattern: "gatc"
    }
  end

  @doc false
  def asigi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "AsiGI",
      pattern: "accggt"
    }
  end

  @doc false
  def asisi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 5,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "AsiSI",
      pattern: "gcgatcgc"
    }
  end

  @doc false
  def asl11923ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Asl11923II",
      pattern: "gggabcc"
    }
  end

  @doc false
  def asp103i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Asp103I",
      pattern: "cgraggc"
    }
  end

  @doc false
  def asp337i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Asp337I",
      pattern: "carabgg"
    }
  end

  @doc false
  def asp700i do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 5,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "Asp700I",
      pattern: "gaannnnttc"
    }
  end

  @doc false
  def asp718i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "Asp718I",
      pattern: "ggtacc"
    }
  end

  @doc false
  def aspa2i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "AspA2I",
      pattern: "cctagg"
    }
  end

  @doc false
  def aspamdiv do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "AspAMDIV",
      pattern: "acccac"
    }
  end

  @doc false
  def aspbhi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 13,
      cut_2: 17,
      cut_3: 0,
      cut_4: 0,
      name: "AspBHI",
      pattern: "yscns"
    }
  end

  @doc false
  def aspdut2v do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "AspDUT2V",
      pattern: "gngcaac"
    }
  end

  @doc false
  def aspjhl3ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "AspJHL3II",
      pattern: "cgcccag"
    }
  end

  @doc false
  def asplei do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 3,
      cut_2: 1,
      cut_3: 0,
      cut_4: 0,
      name: "AspLEI",
      pattern: "gcgc"
    }
  end

  @doc false
  def aspnih4iii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "AspNIH4III",
      pattern: "aagaacb"
    }
  end

  @doc false
  def asps9i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "AspS9I",
      pattern: "ggncc"
    }
  end

  @doc false
  def aspslv7iii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "AspSLV7III",
      pattern: "gtctca"
    }
  end

  @doc false
  def asp114pii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Asp114pII",
      pattern: "agcabcc"
    }
  end

  @doc false
  def asui do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "AsuI",
      pattern: "ggncc"
    }
  end

  @doc false
  def asuii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "AsuII",
      pattern: "ttcgaa"
    }
  end

  @doc false
  def asu14238iv do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Asu14238IV",
      pattern: "cgtrac"
    }
  end

  @doc false
  def asuc2i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "AsuC2I",
      pattern: "ccsgg"
    }
  end

  @doc false
  def asuhpi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 13,
      cut_2: 12,
      cut_3: 0,
      cut_4: 0,
      name: "AsuHPI",
      pattern: "ggtga"
    }
  end

  @doc false
  def asunhi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "AsuNHI",
      pattern: "gctagc"
    }
  end

  @doc false
  def ateti do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "AteTI",
      pattern: "gggrag"
    }
  end

  @doc false
  def avai do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "AvaI",
      pattern: "cycgrg"
    }
  end

  @doc false
  def avaii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "AvaII",
      pattern: "ggwcc"
    }
  end

  @doc false
  def avaiii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "AvaIII",
      pattern: "atgcat"
    }
  end

  @doc false
  def avi249i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Avi249I",
      pattern: "ctgca"
    }
  end

  @doc false
  def avrii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "AvrII",
      pattern: "cctagg"
    }
  end

  @doc false
  def awo1030iv do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Awo1030IV",
      pattern: "gccrag"
    }
  end

  @doc false
  def axyi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "AxyI",
      pattern: "cctnagg"
    }
  end

  @doc false
  def baei do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -11,
      cut_2: -16,
      cut_3: 23,
      cut_4: 18,
      name: "BaeI",
      pattern: "acnnnngtayc"
    }
  end

  @doc false
  def baegi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 5,
      cut_2: 1,
      cut_3: 0,
      cut_4: 0,
      name: "BaeGI",
      pattern: "gkgcmc"
    }
  end

  @doc false
  def bag18758i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Bag18758I",
      pattern: "cccgag"
    }
  end

  @doc false
  def bali do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "BalI",
      pattern: "tggcca"
    }
  end

  @doc false
  def bamhi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BamHI",
      pattern: "ggatcc"
    }
  end

  @doc false
  def bani do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BanI",
      pattern: "ggyrcc"
    }
  end

  @doc false
  def banii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 5,
      cut_2: 1,
      cut_3: 0,
      cut_4: 0,
      name: "BanII",
      pattern: "grgcyc"
    }
  end

  @doc false
  def banli do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "BanLI",
      pattern: "rtcagg"
    }
  end

  @doc false
  def bari do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -8,
      cut_2: -13,
      cut_3: 25,
      cut_4: 20,
      name: "BarI",
      pattern: "gaagnnnnnntac"
    }
  end

  @doc false
  def baui do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BauI",
      pattern: "cacgag"
    }
  end

  @doc false
  def bau1417v do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Bau1417V",
      pattern: "gttcag"
    }
  end

  @doc false
  def bbr52ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Bbr52II",
      pattern: "ggcgag"
    }
  end

  @doc false
  def bbr57iii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Bbr57III",
      pattern: "gtraayg"
    }
  end

  @doc false
  def bbr7017ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Bbr7017II",
      pattern: "cgggag"
    }
  end

  @doc false
  def bbr7017iii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Bbr7017III",
      pattern: "ggrcag"
    }
  end

  @doc false
  def bbrpi do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "BbrPI",
      pattern: "cacgtg"
    }
  end

  @doc false
  def bbsi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 8,
      cut_2: 12,
      cut_3: 0,
      cut_4: 0,
      name: "BbsI",
      pattern: "gaagac"
    }
  end

  @doc false
  def bbub31i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "BbuB31I",
      pattern: "gnaayg"
    }
  end

  @doc false
  def bbub31ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "BbuB31II",
      pattern: "cgrka"
    }
  end

  @doc false
  def bbvi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 13,
      cut_2: 17,
      cut_3: 0,
      cut_4: 0,
      name: "BbvI",
      pattern: "gcagc"
    }
  end

  @doc false
  def bbvii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 8,
      cut_2: 12,
      cut_3: 0,
      cut_4: 0,
      name: "BbvII",
      pattern: "gaagac"
    }
  end

  @doc false
  def bbv12i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 5,
      cut_2: 1,
      cut_3: 0,
      cut_4: 0,
      name: "Bbv12I",
      pattern: "gwgcwc"
    }
  end

  @doc false
  def bbvci do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BbvCI",
      pattern: "cctcagc"
    }
  end

  @doc false
  def bcci do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 9,
      cut_2: 10,
      cut_3: 0,
      cut_4: 0,
      name: "BccI",
      pattern: "ccatc"
    }
  end

  @doc false
  def bce83i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 22,
      cut_2: 20,
      cut_3: 0,
      cut_4: 0,
      name: "Bce83I",
      pattern: "cttgag"
    }
  end

  @doc false
  def bce3081i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Bce3081I",
      pattern: "taggag"
    }
  end

  @doc false
  def bce10661iii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Bce10661III",
      pattern: "tatcnag"
    }
  end

  @doc false
  def bceai do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 17,
      cut_2: 19,
      cut_3: 0,
      cut_4: 0,
      name: "BceAI",
      pattern: "acggc"
    }
  end

  @doc false
  def bcesiv do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -8,
      cut_2: -6,
      cut_3: 14,
      cut_4: 16,
      name: "BceSIV",
      pattern: "gcagc"
    }
  end

  @doc false
  def bcefi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 17,
      cut_2: 18,
      cut_3: 0,
      cut_4: 0,
      name: "BcefI",
      pattern: "acggc"
    }
  end

  @doc false
  def bcgi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -11,
      cut_2: -13,
      cut_3: 24,
      cut_4: 22,
      name: "BcgI",
      pattern: "cgannnnnntgc"
    }
  end

  @doc false
  def bcit130i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "BciT130I",
      pattern: "ccwgg"
    }
  end

  @doc false
  def bcivi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 12,
      cut_2: 11,
      cut_3: 0,
      cut_4: 0,
      name: "BciVI",
      pattern: "gtatcc"
    }
  end

  @doc false
  def bcli do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BclI",
      pattern: "tgatca"
    }
  end

  @doc false
  def bcni do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "BcnI",
      pattern: "ccsgg"
    }
  end

  @doc false
  def bco11035iii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Bco11035III",
      pattern: "gaagcy"
    }
  end

  @doc false
  def bcodi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 6,
      cut_2: 10,
      cut_3: 0,
      cut_4: 0,
      name: "BcoDI",
      pattern: "gtctc"
    }
  end

  @doc false
  def bcui do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BcuI",
      pattern: "actagt"
    }
  end

  @doc false
  def bdai do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -11,
      cut_2: -13,
      cut_3: 24,
      cut_4: 22,
      name: "BdaI",
      pattern: "tgannnnnntca"
    }
  end

  @doc false
  def beti do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BetI",
      pattern: "wccggw"
    }
  end

  @doc false
  def bfai do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "BfaI",
      pattern: "ctag"
    }
  end

  @doc false
  def bfasii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "BfaSII",
      pattern: "ganggag"
    }
  end

  @doc false
  def bfii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 11,
      cut_2: 10,
      cut_3: 0,
      cut_4: 0,
      name: "BfiI",
      pattern: "actggg"
    }
  end

  @doc false
  def bfmi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BfmI",
      pattern: "ctryag"
    }
  end

  @doc false
  def bfoi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 5,
      cut_2: 1,
      cut_3: 0,
      cut_4: 0,
      name: "BfoI",
      pattern: "rgcgcy"
    }
  end

  @doc false
  def bfri do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BfrI",
      pattern: "cttaag"
    }
  end

  @doc false
  def bfui do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 12,
      cut_2: 11,
      cut_3: 0,
      cut_4: 0,
      name: "BfuI",
      pattern: "gtatcc"
    }
  end

  @doc false
  def bfuai do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 10,
      cut_2: 14,
      cut_3: 0,
      cut_4: 0,
      name: "BfuAI",
      pattern: "acctgc"
    }
  end

  @doc false
  def bga514i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Bga514I",
      pattern: "gtraag"
    }
  end

  @doc false
  def bgli do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 7,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "BglI",
      pattern: "gccnnnnnggc"
    }
  end

  @doc false
  def bglii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BglII",
      pattern: "agatct"
    }
  end

  @doc false
  def bhe175ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Bhe175II",
      pattern: "gcccna"
    }
  end

  @doc false
  def bini do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 9,
      cut_2: 10,
      cut_3: 0,
      cut_4: 0,
      name: "BinI",
      pattern: "ggatc"
    }
  end

  @doc false
  def bisi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "BisI",
      pattern: "gcngc"
    }
  end

  @doc false
  def bkram31di do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "BkrAM31DI",
      pattern: "rttaaatm"
    }
  end

  @doc false
  def ble402ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Ble402II",
      pattern: "gragcag"
    }
  end

  @doc false
  def blni do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BlnI",
      pattern: "cctagg"
    }
  end

  @doc false
  def bloaii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "BloAII",
      pattern: "gaggac"
    }
  end

  @doc false
  def blpi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BlpI",
      pattern: "gctnagc"
    }
  end

  @doc false
  def blsi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 3,
      cut_2: 2,
      cut_3: 0,
      cut_4: 0,
      name: "BlsI",
      pattern: "gcngc"
    }
  end

  @doc false
  def bmcai do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "BmcAI",
      pattern: "agtact"
    }
  end

  @doc false
  def bme18i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "Bme18I",
      pattern: "ggwcc"
    }
  end

  @doc false
  def bme1390i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "Bme1390I",
      pattern: "ccngg"
    }
  end

  @doc false
  def bmedi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 3,
      cut_2: 1,
      cut_3: 0,
      cut_4: 0,
      name: "BmeDI",
      pattern: "c"
    }
  end

  @doc false
  def bmeri do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 6,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BmeRI",
      pattern: "gacnnnnngtc"
    }
  end

  @doc false
  def bmet110i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BmeT110I",
      pattern: "cycgrg"
    }
  end

  @doc false
  def bmgi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "BmgI",
      pattern: "gkgccc"
    }
  end

  @doc false
  def bmgbi do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "BmgBI",
      pattern: "cacgtc"
    }
  end

  @doc false
  def bmgt120i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "BmgT120I",
      pattern: "ggncc"
    }
  end

  @doc false
  def bmii do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "BmiI",
      pattern: "ggnncc"
    }
  end

  @doc false
  def bmri do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 11,
      cut_2: 10,
      cut_3: 0,
      cut_4: 0,
      name: "BmrI",
      pattern: "actggg"
    }
  end

  @doc false
  def bmrfi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "BmrFI",
      pattern: "ccngg"
    }
  end

  @doc false
  def bmsi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 10,
      cut_2: 14,
      cut_3: 0,
      cut_4: 0,
      name: "BmsI",
      pattern: "gcatc"
    }
  end

  @doc false
  def bmti do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 5,
      cut_2: 1,
      cut_3: 0,
      cut_4: 0,
      name: "BmtI",
      pattern: "gctagc"
    }
  end

  @doc false
  def bmui do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 11,
      cut_2: 10,
      cut_3: 0,
      cut_4: 0,
      name: "BmuI",
      pattern: "actggg"
    }
  end

  @doc false
  def boxi do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 5,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BoxI",
      pattern: "gacnnnngtc"
    }
  end

  @doc false
  def bpii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 8,
      cut_2: 12,
      cut_3: 0,
      cut_4: 0,
      name: "BpiI",
      pattern: "gaagac"
    }
  end

  @doc false
  def bpli do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -9,
      cut_2: -14,
      cut_3: 24,
      cut_4: 19,
      name: "BplI",
      pattern: "gagnnnnnctc"
    }
  end

  @doc false
  def bpmi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 22,
      cut_2: 20,
      cut_3: 0,
      cut_4: 0,
      name: "BpmI",
      pattern: "ctggag"
    }
  end

  @doc false
  def bps6700iii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Bps6700III",
      pattern: "taccnag"
    }
  end

  @doc false
  def bpu10i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "Bpu10I",
      pattern: "cctnagc"
    }
  end

  @doc false
  def bpu14i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "Bpu14I",
      pattern: "ttcgaa"
    }
  end

  @doc false
  def bpu1102i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "Bpu1102I",
      pattern: "gctnagc"
    }
  end

  @doc false
  def bpuei do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 22,
      cut_2: 20,
      cut_3: 0,
      cut_4: 0,
      name: "BpuEI",
      pattern: "cttgag"
    }
  end

  @doc false
  def bpumi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "BpuMI",
      pattern: "ccsgg"
    }
  end

  @doc false
  def bsai do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 7,
      cut_2: 11,
      cut_3: 0,
      cut_4: 0,
      name: "BsaI",
      pattern: "ggtctc"
    }
  end

  @doc false
  def bsa29i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "Bsa29I",
      pattern: "atcgat"
    }
  end

  @doc false
  def bsaai do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "BsaAI",
      pattern: "yacgtr"
    }
  end

  @doc false
  def bsabi do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 5,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BsaBI",
      pattern: "gatnnnnatc"
    }
  end

  @doc false
  def bsahi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "BsaHI",
      pattern: "grcgyc"
    }
  end

  @doc false
  def bsaji do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BsaJI",
      pattern: "ccnngg"
    }
  end

  @doc false
  def bsawi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BsaWI",
      pattern: "wccggw"
    }
  end

  @doc false
  def bsaxi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -10,
      cut_2: -13,
      cut_3: 21,
      cut_4: 18,
      name: "BsaXI",
      pattern: "acnnnnnctcc"
    }
  end

  @doc false
  def bsbi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 27,
      cut_2: 25,
      cut_3: 0,
      cut_4: 0,
      name: "BsbI",
      pattern: "caacac"
    }
  end

  @doc false
  def bsc4i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 7,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "Bsc4I",
      pattern: "ccnnnnnnngg"
    }
  end

  @doc false
  def bscai do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 9,
      cut_2: 11,
      cut_3: 0,
      cut_4: 0,
      name: "BscAI",
      pattern: "gcatc"
    }
  end

  @doc false
  def bscgi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "BscGI",
      pattern: "cccgt"
    }
  end

  @doc false
  def bscxi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 5,
      cut_2: 1,
      cut_3: 0,
      cut_4: 0,
      name: "BscXI",
      pattern: "gcaggc"
    }
  end

  @doc false
  def bse1i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 6,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "Bse1I",
      pattern: "actgg"
    }
  end

  @doc false
  def bse8i do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 5,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "Bse8I",
      pattern: "gatnnnnatc"
    }
  end

  @doc false
  def bse21i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "Bse21I",
      pattern: "cctnagg"
    }
  end

  @doc false
  def bse118i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "Bse118I",
      pattern: "rccggy"
    }
  end

  @doc false
  def bseai do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BseAI",
      pattern: "tccgga"
    }
  end

  @doc false
  def bsebi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "BseBI",
      pattern: "ccwgg"
    }
  end

  @doc false
  def bseci do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "BseCI",
      pattern: "atcgat"
    }
  end

  @doc false
  def bsedi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BseDI",
      pattern: "ccnngg"
    }
  end

  @doc false
  def bse3di do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 8,
      cut_2: 6,
      cut_3: 0,
      cut_4: 0,
      name: "Bse3DI",
      pattern: "gcaatg"
    }
  end

  @doc false
  def bsegi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 7,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BseGI",
      pattern: "ggatg"
    }
  end

  @doc false
  def bseji do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 5,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BseJI",
      pattern: "gatnnnnatc"
    }
  end

  @doc false
  def bseli do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 7,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "BseLI",
      pattern: "ccnnnnnnngg"
    }
  end

  @doc false
  def bsemi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 8,
      cut_2: 6,
      cut_3: 0,
      cut_4: 0,
      name: "BseMI",
      pattern: "gcaatg"
    }
  end

  @doc false
  def bsemii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 15,
      cut_2: 13,
      cut_3: 0,
      cut_4: 0,
      name: "BseMII",
      pattern: "ctcag"
    }
  end

  @doc false
  def bseni do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 6,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "BseNI",
      pattern: "actgg"
    }
  end

  @doc false
  def bsepi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BsePI",
      pattern: "gcgcgc"
    }
  end

  @doc false
  def bseri do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 16,
      cut_2: 14,
      cut_3: 0,
      cut_4: 0,
      name: "BseRI",
      pattern: "gaggag"
    }
  end

  @doc false
  def bsesi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 5,
      cut_2: 1,
      cut_3: 0,
      cut_4: 0,
      name: "BseSI",
      pattern: "gkgcmc"
    }
  end

  @doc false
  def bsexi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 13,
      cut_2: 17,
      cut_3: 0,
      cut_4: 0,
      name: "BseXI",
      pattern: "gcagc"
    }
  end

  @doc false
  def bsex3i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BseX3I",
      pattern: "cggccg"
    }
  end

  @doc false
  def bseyi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BseYI",
      pattern: "cccagc"
    }
  end

  @doc false
  def bsgi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 22,
      cut_2: 20,
      cut_3: 0,
      cut_4: 0,
      name: "BsgI",
      pattern: "gtgcag"
    }
  end

  @doc false
  def bsh1236i do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 2,
      cut_2: 2,
      cut_3: 0,
      cut_4: 0,
      name: "Bsh1236I",
      pattern: "cgcg"
    }
  end

  @doc false
  def bsh1285i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 4,
      cut_2: 2,
      cut_3: 0,
      cut_4: 0,
      name: "Bsh1285I",
      pattern: "cgrycg"
    }
  end

  @doc false
  def bshfi do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 2,
      cut_2: 2,
      cut_3: 0,
      cut_4: 0,
      name: "BshFI",
      pattern: "ggcc"
    }
  end

  @doc false
  def bshni do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BshNI",
      pattern: "ggyrcc"
    }
  end

  @doc false
  def bshti do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BshTI",
      pattern: "accggt"
    }
  end

  @doc false
  def bshvi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "BshVI",
      pattern: "atcgat"
    }
  end

  @doc false
  def bsii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BsiI",
      pattern: "cacgag"
    }
  end

  @doc false
  def bsiei do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 4,
      cut_2: 2,
      cut_3: 0,
      cut_4: 0,
      name: "BsiEI",
      pattern: "cgrycg"
    }
  end

  @doc false
  def bsihkai do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 5,
      cut_2: 1,
      cut_3: 0,
      cut_4: 0,
      name: "BsiHKAI",
      pattern: "gwgcwc"
    }
  end

  @doc false
  def bsihkci do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BsiHKCI",
      pattern: "cycgrg"
    }
  end

  @doc false
  def bsisi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "BsiSI",
      pattern: "ccgg"
    }
  end

  @doc false
  def bsiwi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BsiWI",
      pattern: "cgtacg"
    }
  end

  @doc false
  def bsiyi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 7,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "BsiYI",
      pattern: "ccnnnnnnngg"
    }
  end

  @doc false
  def bsli do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 7,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "BslI",
      pattern: "ccnnnnnnngg"
    }
  end

  @doc false
  def bslfi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 15,
      cut_2: 19,
      cut_3: 0,
      cut_4: 0,
      name: "BslFI",
      pattern: "gggac"
    }
  end

  @doc false
  def bsmi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 7,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BsmI",
      pattern: "gaatgc"
    }
  end

  @doc false
  def bsmai do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 6,
      cut_2: 10,
      cut_3: 0,
      cut_4: 0,
      name: "BsmAI",
      pattern: "gtctc"
    }
  end

  @doc false
  def bsmbi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 7,
      cut_2: 11,
      cut_3: 0,
      cut_4: 0,
      name: "BsmBI",
      pattern: "cgtctc"
    }
  end

  @doc false
  def bsmfi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 15,
      cut_2: 19,
      cut_3: 0,
      cut_4: 0,
      name: "BsmFI",
      pattern: "gggac"
    }
  end

  @doc false
  def bsni do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 2,
      cut_2: 2,
      cut_3: 0,
      cut_4: 0,
      name: "BsnI",
      pattern: "ggcc"
    }
  end

  @doc false
  def bso31i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 7,
      cut_2: 11,
      cut_3: 0,
      cut_4: 0,
      name: "Bso31I",
      pattern: "ggtctc"
    }
  end

  @doc false
  def bsobi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BsoBI",
      pattern: "cycgrg"
    }
  end

  @doc false
  def bsp13i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "Bsp13I",
      pattern: "tccgga"
    }
  end

  @doc false
  def bsp19i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "Bsp19I",
      pattern: "ccatgg"
    }
  end

  @doc false
  def bsp24i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -9,
      cut_2: -14,
      cut_3: 24,
      cut_4: 19,
      name: "Bsp24I",
      pattern: "gacnnnnnntgg"
    }
  end

  @doc false
  def bsp68i do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "Bsp68I",
      pattern: "tcgcga"
    }
  end

  @doc false
  def bsp119i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "Bsp119I",
      pattern: "ttcgaa"
    }
  end

  @doc false
  def bsp120i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "Bsp120I",
      pattern: "gggccc"
    }
  end

  @doc false
  def bsp143i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -1,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "Bsp143I",
      pattern: "gatc"
    }
  end

  @doc false
  def bsp460iii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Bsp460III",
      pattern: "cgcgcag"
    }
  end

  @doc false
  def bsp1286i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 5,
      cut_2: 1,
      cut_3: 0,
      cut_4: 0,
      name: "Bsp1286I",
      pattern: "gdgchc"
    }
  end

  @doc false
  def bsp1407i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "Bsp1407I",
      pattern: "tgtaca"
    }
  end

  @doc false
  def bsp1720i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "Bsp1720I",
      pattern: "gctnagc"
    }
  end

  @doc false
  def bsp3004iv do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Bsp3004IV",
      pattern: "ccgcat"
    }
  end

  @doc false
  def bspaci do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "BspACI",
      pattern: "ccgc"
    }
  end

  @doc false
  def bspani do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 2,
      cut_2: 2,
      cut_3: 0,
      cut_4: 0,
      name: "BspANI",
      pattern: "ggcc"
    }
  end

  @doc false
  def bspcni do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 14,
      cut_2: 12,
      cut_3: 0,
      cut_4: 0,
      name: "BspCNI",
      pattern: "ctcag"
    }
  end

  @doc false
  def bspdi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "BspDI",
      pattern: "atcgat"
    }
  end

  @doc false
  def bspd6i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 9,
      cut_2: 11,
      cut_3: 0,
      cut_4: 0,
      name: "BspD6I",
      pattern: "gagtc"
    }
  end

  @doc false
  def bspei do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BspEI",
      pattern: "tccgga"
    }
  end

  @doc false
  def bspfni do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 2,
      cut_2: 2,
      cut_3: 0,
      cut_4: 0,
      name: "BspFNI",
      pattern: "cgcg"
    }
  end

  @doc false
  def bspgi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "BspGI",
      pattern: "ctggac"
    }
  end

  @doc false
  def bsphi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BspHI",
      pattern: "tcatga"
    }
  end

  @doc false
  def bspli do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "BspLI",
      pattern: "ggnncc"
    }
  end

  @doc false
  def bsplu11i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BspLU11I",
      pattern: "acatgt"
    }
  end

  @doc false
  def bspmi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 10,
      cut_2: 14,
      cut_3: 0,
      cut_4: 0,
      name: "BspMI",
      pattern: "acctgc"
    }
  end

  @doc false
  def bspmii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BspMII",
      pattern: "tccgga"
    }
  end

  @doc false
  def bspmai do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 5,
      cut_2: 1,
      cut_3: 0,
      cut_4: 0,
      name: "BspMAI",
      pattern: "ctgcag"
    }
  end

  @doc false
  def bspnci do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "BspNCI",
      pattern: "ccaga"
    }
  end

  @doc false
  def bspoi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 5,
      cut_2: 1,
      cut_3: 0,
      cut_4: 0,
      name: "BspOI",
      pattern: "gctagc"
    }
  end

  @doc false
  def bsppi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 9,
      cut_2: 10,
      cut_3: 0,
      cut_4: 0,
      name: "BspPI",
      pattern: "ggatc"
    }
  end

  @doc false
  def bspqi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 8,
      cut_2: 11,
      cut_3: 0,
      cut_4: 0,
      name: "BspQI",
      pattern: "gctcttc"
    }
  end

  @doc false
  def bspti do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BspTI",
      pattern: "cttaag"
    }
  end

  @doc false
  def bspt104i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "BspT104I",
      pattern: "ttcgaa"
    }
  end

  @doc false
  def bspt107i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BspT107I",
      pattern: "ggyrcc"
    }
  end

  @doc false
  def bsptni do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 7,
      cut_2: 11,
      cut_3: 0,
      cut_4: 0,
      name: "BspTNI",
      pattern: "ggtctc"
    }
  end

  @doc false
  def bsri do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 6,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "BsrI",
      pattern: "actgg"
    }
  end

  @doc false
  def bsrbi do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "BsrBI",
      pattern: "ccgctc"
    }
  end

  @doc false
  def bsrdi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 8,
      cut_2: 6,
      cut_3: 0,
      cut_4: 0,
      name: "BsrDI",
      pattern: "gcaatg"
    }
  end

  @doc false
  def bsrfi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BsrFI",
      pattern: "rccggy"
    }
  end

  @doc false
  def bsrgi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BsrGI",
      pattern: "tgtaca"
    }
  end

  @doc false
  def bssai do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BssAI",
      pattern: "rccggy"
    }
  end

  @doc false
  def bsseci do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BssECI",
      pattern: "ccnngg"
    }
  end

  @doc false
  def bsshii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BssHII",
      pattern: "gcgcgc"
    }
  end

  @doc false
  def bssmi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -1,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "BssMI",
      pattern: "gatc"
    }
  end

  @doc false
  def bssni do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "BssNI",
      pattern: "grcgyc"
    }
  end

  @doc false
  def bssnai do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "BssNAI",
      pattern: "gtatac"
    }
  end

  @doc false
  def bsssi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BssSI",
      pattern: "cacgag"
    }
  end

  @doc false
  def bsst1i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BssT1I",
      pattern: "ccwwgg"
    }
  end

  @doc false
  def bst6i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 7,
      cut_2: 10,
      cut_3: 0,
      cut_4: 0,
      name: "Bst6I",
      pattern: "ctcttc"
    }
  end

  @doc false
  def bst1107i do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "Bst1107I",
      pattern: "gtatac"
    }
  end

  @doc false
  def bstaci do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "BstACI",
      pattern: "grcgyc"
    }
  end

  @doc false
  def bstafi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BstAFI",
      pattern: "cttaag"
    }
  end

  @doc false
  def bstapi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 7,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "BstAPI",
      pattern: "gcannnnntgc"
    }
  end

  @doc false
  def bstaui do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BstAUI",
      pattern: "tgtaca"
    }
  end

  @doc false
  def bstbi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "BstBI",
      pattern: "ttcgaa"
    }
  end

  @doc false
  def bst2bi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "Bst2BI",
      pattern: "cacgag"
    }
  end

  @doc false
  def bstbai do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "BstBAI",
      pattern: "yacgtr"
    }
  end

  @doc false
  def bst4ci do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 3,
      cut_2: 2,
      cut_3: 0,
      cut_4: 0,
      name: "Bst4CI",
      pattern: "acngt"
    }
  end

  @doc false
  def bstc8i do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "BstC8I",
      pattern: "gcnngc"
    }
  end

  @doc false
  def bstdei do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "BstDEI",
      pattern: "ctnag"
    }
  end

  @doc false
  def bstdsi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BstDSI",
      pattern: "ccrygg"
    }
  end

  @doc false
  def bsteii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 6,
      cut_3: 0,
      cut_4: 0,
      name: "BstEII",
      pattern: "ggtnacc"
    }
  end

  @doc false
  def bsteni do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 5,
      cut_2: 6,
      cut_3: 0,
      cut_4: 0,
      name: "BstENI",
      pattern: "cctnnnnnagg"
    }
  end

  @doc false
  def bstf5i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 7,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BstF5I",
      pattern: "ggatg"
    }
  end

  @doc false
  def bstfni do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 2,
      cut_2: 2,
      cut_3: 0,
      cut_4: 0,
      name: "BstFNI",
      pattern: "cgcg"
    }
  end

  @doc false
  def bsth2i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 5,
      cut_2: 1,
      cut_3: 0,
      cut_4: 0,
      name: "BstH2I",
      pattern: "rgcgcy"
    }
  end

  @doc false
  def bsthhi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 3,
      cut_2: 1,
      cut_3: 0,
      cut_4: 0,
      name: "BstHHI",
      pattern: "gcgc"
    }
  end

  @doc false
  def bstkti do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 3,
      cut_2: 1,
      cut_3: 0,
      cut_4: 0,
      name: "BstKTI",
      pattern: "gatc"
    }
  end

  @doc false
  def bstmai do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 6,
      cut_2: 10,
      cut_3: 0,
      cut_4: 0,
      name: "BstMAI",
      pattern: "gtctc"
    }
  end

  @doc false
  def bstmbi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -1,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "BstMBI",
      pattern: "gatc"
    }
  end

  @doc false
  def bstmci do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 4,
      cut_2: 2,
      cut_3: 0,
      cut_4: 0,
      name: "BstMCI",
      pattern: "cgrycg"
    }
  end

  @doc false
  def bstmwi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 7,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "BstMWI",
      pattern: "gcnnnnnnngc"
    }
  end

  @doc false
  def bstni do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "BstNI",
      pattern: "ccwgg"
    }
  end

  @doc false
  def bstnsi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 5,
      cut_2: 1,
      cut_3: 0,
      cut_4: 0,
      name: "BstNSI",
      pattern: "rcatgy"
    }
  end

  @doc false
  def bstpi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 6,
      cut_3: 0,
      cut_4: 0,
      name: "BstPI",
      pattern: "ggtnacc"
    }
  end

  @doc false
  def bstpai do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 5,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BstPAI",
      pattern: "gacnnnngtc"
    }
  end

  @doc false
  def bstsci do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BstSCI",
      pattern: "ccngg"
    }
  end

  @doc false
  def bstsfi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BstSFI",
      pattern: "ctryag"
    }
  end

  @doc false
  def bstsli do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 5,
      cut_2: 1,
      cut_3: 0,
      cut_4: 0,
      name: "BstSLI",
      pattern: "gkgcmc"
    }
  end

  @doc false
  def bstsni do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "BstSNI",
      pattern: "tacgta"
    }
  end

  @doc false
  def bstui do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 2,
      cut_2: 2,
      cut_3: 0,
      cut_4: 0,
      name: "BstUI",
      pattern: "cgcg"
    }
  end

  @doc false
  def bst2ui do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "Bst2UI",
      pattern: "ccwgg"
    }
  end

  @doc false
  def bstv1i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 13,
      cut_2: 17,
      cut_3: 0,
      cut_4: 0,
      name: "BstV1I",
      pattern: "gcagc"
    }
  end

  @doc false
  def bstv2i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 8,
      cut_2: 12,
      cut_3: 0,
      cut_4: 0,
      name: "BstV2I",
      pattern: "gaagac"
    }
  end

  @doc false
  def bstxi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 8,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "BstXI",
      pattern: "ccannnnnntgg"
    }
  end

  @doc false
  def bstx2i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BstX2I",
      pattern: "rgatcy"
    }
  end

  @doc false
  def bstyi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BstYI",
      pattern: "rgatcy"
    }
  end

  @doc false
  def bstzi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BstZI",
      pattern: "cggccg"
    }
  end

  @doc false
  def bstz17i do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "BstZ17I",
      pattern: "gtatac"
    }
  end

  @doc false
  def bsui do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 12,
      cut_2: 11,
      cut_3: 0,
      cut_4: 0,
      name: "BsuI",
      pattern: "gtatcc"
    }
  end

  @doc false
  def bsu15i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "Bsu15I",
      pattern: "atcgat"
    }
  end

  @doc false
  def bsu36i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "Bsu36I",
      pattern: "cctnagg"
    }
  end

  @doc false
  def bsuri do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 2,
      cut_2: 2,
      cut_3: 0,
      cut_4: 0,
      name: "BsuRI",
      pattern: "ggcc"
    }
  end

  @doc false
  def bsutui do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "BsuTUI",
      pattern: "atcgat"
    }
  end

  @doc false
  def btgi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BtgI",
      pattern: "ccrygg"
    }
  end

  @doc false
  def btgzi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 16,
      cut_2: 20,
      cut_3: 0,
      cut_4: 0,
      name: "BtgZI",
      pattern: "gcgatg"
    }
  end

  @doc false
  def bthci do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 4,
      cut_2: 1,
      cut_3: 0,
      cut_4: 0,
      name: "BthCI",
      pattern: "gcngc"
    }
  end

  @doc false
  def btri do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "BtrI",
      pattern: "cacgtc"
    }
  end

  @doc false
  def btsi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 8,
      cut_2: 6,
      cut_3: 0,
      cut_4: 0,
      name: "BtsI",
      pattern: "gcagtg"
    }
  end

  @doc false
  def btsimuti do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 7,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BtsIMutI",
      pattern: "cagtg"
    }
  end

  @doc false
  def btsci do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 7,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "BtsCI",
      pattern: "ggatg"
    }
  end

  @doc false
  def btumi do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "BtuMI",
      pattern: "tcgcga"
    }
  end

  @doc false
  def bvei do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 10,
      cut_2: 14,
      cut_3: 0,
      cut_4: 0,
      name: "BveI",
      pattern: "acctgc"
    }
  end

  @doc false
  def bve1b23i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Bve1B23I",
      pattern: "gacnnnnntgg"
    }
  end

  @doc false
  def cac8i do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "Cac8I",
      pattern: "gcnngc"
    }
  end

  @doc false
  def caii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 6,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "CaiI",
      pattern: "cagnnnctg"
    }
  end

  @doc false
  def cal14237i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Cal14237I",
      pattern: "ggttag"
    }
  end

  @doc false
  def calb3ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "CalB3II",
      pattern: "grttrag"
    }
  end

  @doc false
  def cauii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "CauII",
      pattern: "ccsgg"
    }
  end

  @doc false
  def cau10061ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Cau10061II",
      pattern: "gttaat"
    }
  end

  @doc false
  def cba13ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Cba13II",
      pattern: "aggaat"
    }
  end

  @doc false
  def cba16038i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Cba16038I",
      pattern: "cctnaync"
    }
  end

  @doc false
  def cbo67071iv do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Cbo67071IV",
      pattern: "gcrgaag"
    }
  end

  @doc false
  def cchii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 17,
      cut_2: 15,
      cut_3: 0,
      cut_4: 0,
      name: "CchII",
      pattern: "ggarga"
    }
  end

  @doc false
  def cchiii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 26,
      cut_2: 24,
      cut_3: 0,
      cut_4: 0,
      name: "CchIII",
      pattern: "cccaag"
    }
  end

  @doc false
  def cch467iii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Cch467III",
      pattern: "gngaaay"
    }
  end

  @doc false
  def ccii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "CciI",
      pattern: "tcatga"
    }
  end

  @doc false
  def ccini do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 6,
      cut_3: 0,
      cut_4: 0,
      name: "CciNI",
      pattern: "gcggccgc"
    }
  end

  @doc false
  def cco11366vi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Cco11366VI",
      pattern: "gaagaa"
    }
  end

  @doc false
  def cco11437v do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Cco11437V",
      pattern: "caynnnnnrtag"
    }
  end

  @doc false
  def cco14983v do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Cco14983V",
      pattern: "gggtda"
    }
  end

  @doc false
  def cco14983vi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Cco14983VI",
      pattern: "gcyga"
    }
  end

  @doc false
  def ccrnaiii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "CcrNAIII",
      pattern: "cgaccag"
    }
  end

  @doc false
  def cdii do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 4,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "CdiI",
      pattern: "catcg"
    }
  end

  @doc false
  def cdi11397i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Cdi11397I",
      pattern: "gcgcag"
    }
  end

  @doc false
  def cdi13746v do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Cdi13746V",
      pattern: "rgaaagr"
    }
  end

  @doc false
  def cdi13750iii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Cdi13750III",
      pattern: "ccgatcc"
    }
  end

  @doc false
  def cdpi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 26,
      cut_2: 24,
      cut_3: 0,
      cut_4: 0,
      name: "CdpI",
      pattern: "gcggag"
    }
  end

  @doc false
  def cdu23823ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Cdu23823II",
      pattern: "gtgaag"
    }
  end

  @doc false
  def cfa8380i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Cfa8380I",
      pattern: "grggay"
    }
  end

  @doc false
  def cfoi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 3,
      cut_2: 1,
      cut_3: 0,
      cut_4: 0,
      name: "CfoI",
      pattern: "gcgc"
    }
  end

  @doc false
  def cfri do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "CfrI",
      pattern: "yggccr"
    }
  end

  @doc false
  def cfr9i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "Cfr9I",
      pattern: "cccggg"
    }
  end

  @doc false
  def cfr10i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "Cfr10I",
      pattern: "rccggy"
    }
  end

  @doc false
  def cfr13i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "Cfr13I",
      pattern: "ggncc"
    }
  end

  @doc false
  def cfr42i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 4,
      cut_2: 2,
      cut_3: 0,
      cut_4: 0,
      name: "Cfr42I",
      pattern: "ccgcgg"
    }
  end

  @doc false
  def cfrmh13ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "CfrMH13II",
      pattern: "agcancc"
    }
  end

  @doc false
  def cfrmh16vi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "CfrMH16VI",
      pattern: "ctaaag"
    }
  end

  @doc false
  def cfupf3ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Cfupf3II",
      pattern: "garcag"
    }
  end

  @doc false
  def cgl13032i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Cgl13032I",
      pattern: "ggcgca"
    }
  end

  @doc false
  def cgl13032ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Cgl13032II",
      pattern: "acgabgg"
    }
  end

  @doc false
  def chai do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 4,
      cut_2: -1,
      cut_3: 0,
      cut_4: 0,
      name: "ChaI",
      pattern: "gatc"
    }
  end

  @doc false
  def cin11811i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Cin11811I",
      pattern: "tgkmca"
    }
  end

  @doc false
  def cjei do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -9,
      cut_2: -15,
      cut_3: 26,
      cut_4: 20,
      name: "CjeI",
      pattern: "ccannnnnngt"
    }
  end

  @doc false
  def cje265v do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Cje265V",
      pattern: "gkaagc"
    }
  end

  @doc false
  def cje54107iii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Cje54107III",
      pattern: "gkaayc"
    }
  end

  @doc false
  def cjefiii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "CjeFIII",
      pattern: "gcaagg"
    }
  end

  @doc false
  def cjefv do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "CjeFV",
      pattern: "ggrca"
    }
  end

  @doc false
  def cjenii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "CjeNII",
      pattern: "gagnnnnngt"
    }
  end

  @doc false
  def cjeniii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 25,
      cut_2: 23,
      cut_3: 0,
      cut_4: 0,
      name: "CjeNIII",
      pattern: "gkaayg"
    }
  end

  @doc false
  def cjenv do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "CjeNV",
      pattern: "ccyga"
    }
  end

  @doc false
  def cjepi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -8,
      cut_2: -14,
      cut_3: 26,
      cut_4: 20,
      name: "CjePI",
      pattern: "ccannnnnnntc"
    }
  end

  @doc false
  def cjep659iv do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "CjeP659IV",
      pattern: "cacnnnnnnngaa"
    }
  end

  @doc false
  def cjui do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "CjuI",
      pattern: "caynnnnnrtg"
    }
  end

  @doc false
  def cjuii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "CjuII",
      pattern: "caynnnnnctc"
    }
  end

  @doc false
  def cko11077iv do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Cko11077IV",
      pattern: "tgacag"
    }
  end

  @doc false
  def clai do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "ClaI",
      pattern: "atcgat"
    }
  end

  @doc false
  def cla11845iii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Cla11845III",
      pattern: "gcgaa"
    }
  end

  @doc false
  def cly7489ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Cly7489II",
      pattern: "aaaagrg"
    }
  end

  @doc false
  def cpe2837iii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Cpe2837III",
      pattern: "grnacayt"
    }
  end

  @doc false
  def cpe10578v do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Cpe10578V",
      pattern: "gangagy"
    }
  end

  @doc false
  def cpe13170ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Cpe13170II",
      pattern: "gttgnag"
    }
  end

  @doc false
  def cpoi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "CpoI",
      pattern: "cggwccg"
    }
  end

  @doc false
  def cre7908i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Cre7908I",
      pattern: "gcggga"
    }
  end

  @doc false
  def csa9238ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Csa9238II",
      pattern: "caaantc"
    }
  end

  @doc false
  def csei do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 10,
      cut_2: 15,
      cut_3: 0,
      cut_4: 0,
      name: "CseI",
      pattern: "gacgc"
    }
  end

  @doc false
  def csii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 6,
      cut_3: 0,
      cut_4: 0,
      name: "CsiI",
      pattern: "accwggt"
    }
  end

  @doc false
  def cspi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "CspI",
      pattern: "cggwccg"
    }
  end

  @doc false
  def csp6i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "Csp6I",
      pattern: "gtac"
    }
  end

  @doc false
  def csp2014i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Csp2014I",
      pattern: "ggaggc"
    }
  end

  @doc false
  def cspai do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "CspAI",
      pattern: "accggt"
    }
  end

  @doc false
  def cspbp25iii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "CspBP25III",
      pattern: "ccannnnnrtga"
    }
  end

  @doc false
  def cspci do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -12,
      cut_2: -14,
      cut_3: 24,
      cut_4: 22,
      name: "CspCI",
      pattern: "caannnnngtgg"
    }
  end

  @doc false
  def cspl61i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "CspL61I",
      pattern: "tygayct"
    }
  end

  @doc false
  def cspx1ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "CspX1II",
      pattern: "acccca"
    }
  end

  @doc false
  def cstmi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 26,
      cut_2: 24,
      cut_3: 0,
      cut_4: 0,
      name: "CstMI",
      pattern: "aaggag"
    }
  end

  @doc false
  def cviaii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "CviAII",
      pattern: "catg"
    }
  end

  @doc false
  def cviji do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 2,
      cut_2: 2,
      cut_3: 0,
      cut_4: 0,
      name: "CviJI",
      pattern: "rgcy"
    }
  end

  @doc false
  def cviki_1 do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 2,
      cut_2: 2,
      cut_3: 0,
      cut_4: 0,
      name: "CviKI-1",
      pattern: "rgcy"
    }
  end

  @doc false
  def cviqi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "CviQI",
      pattern: "gtac"
    }
  end

  @doc false
  def cviri do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 2,
      cut_2: 2,
      cut_3: 0,
      cut_4: 0,
      name: "CviRI",
      pattern: "tgca"
    }
  end

  @doc false
  def ddei do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "DdeI",
      pattern: "ctnag"
    }
  end

  @doc false
  def dde51507i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Dde51507I",
      pattern: "ccwgg"
    }
  end

  @doc false
  def dini do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "DinI",
      pattern: "ggcgcc"
    }
  end

  @doc false
  def dpi3069i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Dpi3069I",
      pattern: "gacag"
    }
  end

  @doc false
  def dpi3084i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Dpi3084I",
      pattern: "cgrag"
    }
  end

  @doc false
  def dpi3090ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Dpi3090II",
      pattern: "aagrag"
    }
  end

  @doc false
  def dpni do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 2,
      cut_2: 2,
      cut_3: 0,
      cut_4: 0,
      name: "DpnI",
      pattern: "gatc"
    }
  end

  @doc false
  def dpnii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -1,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "DpnII",
      pattern: "gatc"
    }
  end

  @doc false
  def drai do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "DraI",
      pattern: "tttaaa"
    }
  end

  @doc false
  def draii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "DraII",
      pattern: "rggnccy"
    }
  end

  @doc false
  def draiii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 6,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "DraIII",
      pattern: "cacnnngtg"
    }
  end

  @doc false
  def drari do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 27,
      cut_2: 25,
      cut_3: 0,
      cut_4: 0,
      name: "DraRI",
      pattern: "caagnac"
    }
  end

  @doc false
  def drdi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 7,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "DrdI",
      pattern: "gacnnnnnngtc"
    }
  end

  @doc false
  def drdii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "DrdII",
      pattern: "gaacca"
    }
  end

  @doc false
  def drdiv do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 26,
      cut_2: 24,
      cut_3: 0,
      cut_4: 0,
      name: "DrdIV",
      pattern: "tacgac"
    }
  end

  @doc false
  def drdv do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 17,
      cut_2: 15,
      cut_3: 0,
      cut_4: 0,
      name: "DrdV",
      pattern: "catgnac"
    }
  end

  @doc false
  def drdvi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "DrdVI",
      pattern: "gcagcc"
    }
  end

  @doc false
  def drdviii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "DrdVIII",
      pattern: "argagc"
    }
  end

  @doc false
  def drii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 6,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "DriI",
      pattern: "gacnnnnngtc"
    }
  end

  @doc false
  def dsai do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "DsaI",
      pattern: "ccrygg"
    }
  end

  @doc false
  def dsedi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 7,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "DseDI",
      pattern: "gacnnnnnngtc"
    }
  end

  @doc false
  def dsps02ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "DspS02II",
      pattern: "tgccgac"
    }
  end

  @doc false
  def dvuiii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "DvuIII",
      pattern: "cacncac"
    }
  end

  @doc false
  def eaei do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "EaeI",
      pattern: "yggccr"
    }
  end

  @doc false
  def eagi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "EagI",
      pattern: "cggccg"
    }
  end

  @doc false
  def eam1104i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 7,
      cut_2: 10,
      cut_3: 0,
      cut_4: 0,
      name: "Eam1104I",
      pattern: "ctcttc"
    }
  end

  @doc false
  def eam1105i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 6,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "Eam1105I",
      pattern: "gacnnnnngtc"
    }
  end

  @doc false
  def eari do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 7,
      cut_2: 10,
      cut_3: 0,
      cut_4: 0,
      name: "EarI",
      pattern: "ctcttc"
    }
  end

  @doc false
  def ecii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 17,
      cut_2: 15,
      cut_3: 0,
      cut_4: 0,
      name: "EciI",
      pattern: "ggcgga"
    }
  end

  @doc false
  def ecl136ii do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "Ecl136II",
      pattern: "gagctc"
    }
  end

  @doc false
  def ecl234i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Ecl234I",
      pattern: "cggnaag"
    }
  end

  @doc false
  def ecl35734i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Ecl35734I",
      pattern: "gaaaytc"
    }
  end

  @doc false
  def eclxi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "EclXI",
      pattern: "cggccg"
    }
  end

  @doc false
  def eco24i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 5,
      cut_2: 1,
      cut_3: 0,
      cut_4: 0,
      name: "Eco24I",
      pattern: "grgcyc"
    }
  end

  @doc false
  def eco31i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 7,
      cut_2: 11,
      cut_3: 0,
      cut_4: 0,
      name: "Eco31I",
      pattern: "ggtctc"
    }
  end

  @doc false
  def eco32i do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "Eco32I",
      pattern: "gatatc"
    }
  end

  @doc false
  def eco47i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "Eco47I",
      pattern: "ggwcc"
    }
  end

  @doc false
  def eco47iii do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "Eco47III",
      pattern: "agcgct"
    }
  end

  @doc false
  def eco52i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "Eco52I",
      pattern: "cggccg"
    }
  end

  @doc false
  def eco57i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 22,
      cut_2: 20,
      cut_3: 0,
      cut_4: 0,
      name: "Eco57I",
      pattern: "ctgaag"
    }
  end

  @doc false
  def eco72i do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "Eco72I",
      pattern: "cacgtg"
    }
  end

  @doc false
  def eco81i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "Eco81I",
      pattern: "cctnagg"
    }
  end

  @doc false
  def eco88i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "Eco88I",
      pattern: "cycgrg"
    }
  end

  @doc false
  def eco91i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 6,
      cut_3: 0,
      cut_4: 0,
      name: "Eco91I",
      pattern: "ggtnacc"
    }
  end

  @doc false
  def eco105i do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "Eco105I",
      pattern: "tacgta"
    }
  end

  @doc false
  def eco130i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "Eco130I",
      pattern: "ccwwgg"
    }
  end

  @doc false
  def eco147i do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "Eco147I",
      pattern: "aggcct"
    }
  end

  @doc false
  def eco4174i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Eco4174I",
      pattern: "gcacag"
    }
  end

  @doc false
  def eco4465ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Eco4465II",
      pattern: "gaaabcc"
    }
  end

  @doc false
  def eco8164i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Eco8164I",
      pattern: "gcckag"
    }
  end

  @doc false
  def eco9009ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Eco9009II",
      pattern: "gaaantc"
    }
  end

  @doc false
  def eco9020i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Eco9020I",
      pattern: "cgaabtt"
    }
  end

  @doc false
  def eco9035i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Eco9035I",
      pattern: "gggantt"
    }
  end

  @doc false
  def eco9699ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Eco9699II",
      pattern: "tagarc"
    }
  end

  @doc false
  def eco43896ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Eco43896II",
      pattern: "crarcag"
    }
  end

  @doc false
  def ecoblmcrx do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "EcoBLMcrX",
      pattern: "rcsrc"
    }
  end

  @doc false
  def ecoe1140i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "EcoE1140I",
      pattern: "accyac"
    }
  end

  @doc false
  def ecohi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "EcoHI",
      pattern: "ccsgg"
    }
  end

  @doc false
  def ecohsi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "EcoHSI",
      pattern: "ggtaag"
    }
  end

  @doc false
  def ecoicri do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "EcoICRI",
      pattern: "gagctc"
    }
  end

  @doc false
  def eco57mi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 22,
      cut_2: 20,
      cut_3: 0,
      cut_4: 0,
      name: "Eco57MI",
      pattern: "ctgrag"
    }
  end

  @doc false
  def ecomvii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "EcoMVII",
      pattern: "cancatc"
    }
  end

  @doc false
  def econi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 5,
      cut_2: 6,
      cut_3: 0,
      cut_4: 0,
      name: "EcoNI",
      pattern: "cctnnnnnagg"
    }
  end

  @doc false
  def econih6ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "EcoNIH6II",
      pattern: "atgaag"
    }
  end

  @doc false
  def ecoo65i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 6,
      cut_3: 0,
      cut_4: 0,
      name: "EcoO65I",
      pattern: "ggtnacc"
    }
  end

  @doc false
  def ecoo109i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "EcoO109I",
      pattern: "rggnccy"
    }
  end

  @doc false
  def ecori do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "EcoRI",
      pattern: "gaattc"
    }
  end

  @doc false
  def ecorii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "EcoRII",
      pattern: "ccwgg"
    }
  end

  @doc false
  def ecorv do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "EcoRV",
      pattern: "gatatc"
    }
  end

  @doc false
  def ecot14i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "EcoT14I",
      pattern: "ccwwgg"
    }
  end

  @doc false
  def ecot22i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 5,
      cut_2: 1,
      cut_3: 0,
      cut_4: 0,
      name: "EcoT22I",
      pattern: "atgcat"
    }
  end

  @doc false
  def ecot38i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 5,
      cut_2: 1,
      cut_3: 0,
      cut_4: 0,
      name: "EcoT38I",
      pattern: "grgcyc"
    }
  end

  @doc false
  def eco53ki do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "Eco53kI",
      pattern: "gagctc"
    }
  end

  @doc false
  def egei do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "EgeI",
      pattern: "ggcgcc"
    }
  end

  @doc false
  def ehei do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "EheI",
      pattern: "ggcgcc"
    }
  end

  @doc false
  def ehi46392i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Ehi46392I",
      pattern: "cccnnag"
    }
  end

  @doc false
  def eli8509ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Eli8509II",
      pattern: "ccggag"
    }
  end

  @doc false
  def erhi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "ErhI",
      pattern: "ccwwgg"
    }
  end

  @doc false
  def erhg4t10i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "ErhG4T10I",
      pattern: "cgannnnnntc"
    }
  end

  @doc false
  def esabc3i do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 2,
      cut_2: 2,
      cut_3: 0,
      cut_4: 0,
      name: "EsaBC3I",
      pattern: "tcga"
    }
  end

  @doc false
  def esassi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "EsaSSI",
      pattern: "gaccac"
    }
  end

  @doc false
  def espi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "EspI",
      pattern: "gctnagc"
    }
  end

  @doc false
  def esp3i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 7,
      cut_2: 11,
      cut_3: 0,
      cut_4: 0,
      name: "Esp3I",
      pattern: "cgtctc"
    }
  end

  @doc false
  def esp3007i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Esp3007I",
      pattern: "cagaag"
    }
  end

  @doc false
  def faei do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 4,
      cut_2: -1,
      cut_3: 0,
      cut_4: 0,
      name: "FaeI",
      pattern: "catg"
    }
  end

  @doc false
  def faii do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 2,
      cut_2: 2,
      cut_3: 0,
      cut_4: 0,
      name: "FaiI",
      pattern: "yatr"
    }
  end

  @doc false
  def fali do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -9,
      cut_2: -14,
      cut_3: 24,
      cut_4: 19,
      name: "FalI",
      pattern: "aagnnnnnctt"
    }
  end

  @doc false
  def faqi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 15,
      cut_2: 19,
      cut_3: 0,
      cut_4: 0,
      name: "FaqI",
      pattern: "gggac"
    }
  end

  @doc false
  def fati do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -1,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "FatI",
      pattern: "catg"
    }
  end

  @doc false
  def faui do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 9,
      cut_2: 11,
      cut_3: 0,
      cut_4: 0,
      name: "FauI",
      pattern: "cccgc"
    }
  end

  @doc false
  def faundi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "FauNDI",
      pattern: "catatg"
    }
  end

  @doc false
  def fbai do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "FbaI",
      pattern: "tgatca"
    }
  end

  @doc false
  def fba202z8ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Fba202Z8II",
      pattern: "agaagg"
    }
  end

  @doc false
  def fbli do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "FblI",
      pattern: "gtmkac"
    }
  end

  @doc false
  def fco1691iv do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Fco1691IV",
      pattern: "gcvgag"
    }
  end

  @doc false
  def fini do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "FinI",
      pattern: "gggac"
    }
  end

  @doc false
  def fmui do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 4,
      cut_2: 1,
      cut_3: 0,
      cut_4: 0,
      name: "FmuI",
      pattern: "ggncc"
    }
  end

  @doc false
  def fna13121i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Fna13121I",
      pattern: "ttgayc"
    }
  end

  @doc false
  def fnu11326ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Fnu11326II",
      pattern: "gagnnnnrtay"
    }
  end

  @doc false
  def fnu11326iv do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Fnu11326IV",
      pattern: "cttaatt"
    }
  end

  @doc false
  def fnudii do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 2,
      cut_2: 2,
      cut_3: 0,
      cut_4: 0,
      name: "FnuDII",
      pattern: "cgcg"
    }
  end

  @doc false
  def fnu4hi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "Fnu4HI",
      pattern: "gcngc"
    }
  end

  @doc false
  def foki do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 14,
      cut_2: 18,
      cut_3: 0,
      cut_4: 0,
      name: "FokI",
      pattern: "ggatg"
    }
  end

  @doc false
  def frioi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 5,
      cut_2: 1,
      cut_3: 0,
      cut_4: 0,
      name: "FriOI",
      pattern: "grgcyc"
    }
  end

  @doc false
  def fsei do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 6,
      cut_2: 2,
      cut_3: 0,
      cut_4: 0,
      name: "FseI",
      pattern: "ggccggcc"
    }
  end

  @doc false
  def fspi do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "FspI",
      pattern: "tgcgca"
    }
  end

  @doc false
  def fspai do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 4,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "FspAI",
      pattern: "rtgcgcay"
    }
  end

  @doc false
  def fspbi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "FspBI",
      pattern: "ctag"
    }
  end

  @doc false
  def fspei do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 14,
      cut_2: 18,
      cut_3: 0,
      cut_4: 0,
      name: "FspEI",
      pattern: "cc"
    }
  end

  @doc false
  def fsp4hi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "Fsp4HI",
      pattern: "gcngc"
    }
  end

  @doc false
  def fsppk15i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "FspPK15I",
      pattern: "gargaag"
    }
  end

  @doc false
  def ftnuv do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "FtnUV",
      pattern: "gaaaca"
    }
  end

  @doc false
  def gaut27i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "GauT27I",
      pattern: "cgcgcagg"
    }
  end

  @doc false
  def gba708ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Gba708II",
      pattern: "atgcac"
    }
  end

  @doc false
  def gdiii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "GdiII",
      pattern: "cggccr"
    }
  end

  @doc false
  def glai do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 2,
      cut_2: 2,
      cut_3: 0,
      cut_4: 0,
      name: "GlaI",
      pattern: "gcgc"
    }
  end

  @doc false
  def glui do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "GluI",
      pattern: "gcngc"
    }
  end

  @doc false
  def gru56503ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Gru56503II",
      pattern: "carabgc"
    }
  end

  @doc false
  def gsai do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 5,
      cut_2: 1,
      cut_3: 0,
      cut_4: 0,
      name: "GsaI",
      pattern: "cccagc"
    }
  end

  @doc false
  def gsui do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 22,
      cut_2: 20,
      cut_3: 0,
      cut_4: 0,
      name: "GsuI",
      pattern: "ctggag"
    }
  end

  @doc false
  def haei do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "HaeI",
      pattern: "wggccw"
    }
  end

  @doc false
  def haeii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 5,
      cut_2: 1,
      cut_3: 0,
      cut_4: 0,
      name: "HaeII",
      pattern: "rgcgcy"
    }
  end

  @doc false
  def haeiii do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 2,
      cut_2: 2,
      cut_3: 0,
      cut_4: 0,
      name: "HaeIII",
      pattern: "ggcc"
    }
  end

  @doc false
  def haeiv do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -8,
      cut_2: -14,
      cut_3: 25,
      cut_4: 20,
      name: "HaeIV",
      pattern: "gaynnnnnrtc"
    }
  end

  @doc false
  def hapii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "HapII",
      pattern: "ccgg"
    }
  end

  @doc false
  def hauii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 17,
      cut_2: 15,
      cut_3: 0,
      cut_4: 0,
      name: "HauII",
      pattern: "tggcca"
    }
  end

  @doc false
  def hbaii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "HbaII",
      pattern: "gcccag"
    }
  end

  @doc false
  def hca13221v do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Hca13221V",
      pattern: "cacnnnnnrtay"
    }
  end

  @doc false
  def hdeny26i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "HdeNY26I",
      pattern: "cgannnnnntcc"
    }
  end

  @doc false
  def hdeza17i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "HdeZA17I",
      pattern: "gcannnnnntcc"
    }
  end

  @doc false
  def hgai do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 10,
      cut_2: 15,
      cut_3: 0,
      cut_4: 0,
      name: "HgaI",
      pattern: "gacgc"
    }
  end

  @doc false
  def hgiai do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 5,
      cut_2: 1,
      cut_3: 0,
      cut_4: 0,
      name: "HgiAI",
      pattern: "gwgcwc"
    }
  end

  @doc false
  def hgici do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "HgiCI",
      pattern: "ggyrcc"
    }
  end

  @doc false
  def hgieii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "HgiEII",
      pattern: "accnnnnnnggt"
    }
  end

  @doc false
  def hgijii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 5,
      cut_2: 1,
      cut_3: 0,
      cut_4: 0,
      name: "HgiJII",
      pattern: "grgcyc"
    }
  end

  @doc false
  def hhai do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 3,
      cut_2: 1,
      cut_3: 0,
      cut_4: 0,
      name: "HhaI",
      pattern: "gcgc"
    }
  end

  @doc false
  def hin1i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "Hin1I",
      pattern: "grcgyc"
    }
  end

  @doc false
  def hin1ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 4,
      cut_2: -1,
      cut_3: 0,
      cut_4: 0,
      name: "Hin1II",
      pattern: "catg"
    }
  end

  @doc false
  def hin4i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -9,
      cut_2: -14,
      cut_3: 24,
      cut_4: 19,
      name: "Hin4I",
      pattern: "gaynnnnnvtc"
    }
  end

  @doc false
  def hin4ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 11,
      cut_2: 10,
      cut_3: 0,
      cut_4: 0,
      name: "Hin4II",
      pattern: "ccttc"
    }
  end

  @doc false
  def hin6i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "Hin6I",
      pattern: "gcgc"
    }
  end

  @doc false
  def hinp1i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "HinP1I",
      pattern: "gcgc"
    }
  end

  @doc false
  def hincii do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "HincII",
      pattern: "gtyrac"
    }
  end

  @doc false
  def hindii do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "HindII",
      pattern: "gtyrac"
    }
  end

  @doc false
  def hindiii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "HindIII",
      pattern: "aagctt"
    }
  end

  @doc false
  def hinfi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "HinfI",
      pattern: "gantc"
    }
  end

  @doc false
  def hpai do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "HpaI",
      pattern: "gttaac"
    }
  end

  @doc false
  def hpaii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "HpaII",
      pattern: "ccgg"
    }
  end

  @doc false
  def hphi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 13,
      cut_2: 12,
      cut_3: 0,
      cut_4: 0,
      name: "HphI",
      pattern: "ggtga"
    }
  end

  @doc false
  def hpy8i do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "Hpy8I",
      pattern: "gtnnac"
    }
  end

  @doc false
  def hpy99i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 5,
      cut_2: -1,
      cut_3: 0,
      cut_4: 0,
      name: "Hpy99I",
      pattern: "cgwcg"
    }
  end

  @doc false
  def hpy99xiii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Hpy99XIII",
      pattern: "gccta"
    }
  end

  @doc false
  def hpy99xiv do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Hpy99XIV",
      pattern: "ggwtaa"
    }
  end

  @doc false
  def hpy99xiv_mut1 do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Hpy99XIV-mut1",
      pattern: "ggwcna"
    }
  end

  @doc false
  def hpy99xxii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Hpy99XXII",
      pattern: "cyannnnnntga"
    }
  end

  @doc false
  def hpy166ii do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "Hpy166II",
      pattern: "gtnnac"
    }
  end

  @doc false
  def hpy178iii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "Hpy178III",
      pattern: "tcnnga"
    }
  end

  @doc false
  def hpy188i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 3,
      cut_2: 2,
      cut_3: 0,
      cut_4: 0,
      name: "Hpy188I",
      pattern: "tcnga"
    }
  end

  @doc false
  def hpy188iii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "Hpy188III",
      pattern: "tcnnga"
    }
  end

  @doc false
  def hpy300xi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Hpy300XI",
      pattern: "cctyna"
    }
  end

  @doc false
  def hpyav do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 11,
      cut_2: 10,
      cut_3: 0,
      cut_4: 0,
      name: "HpyAV",
      pattern: "ccttc"
    }
  end

  @doc false
  def hpyaxiv do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "HpyAXIV",
      pattern: "gcgta"
    }
  end

  @doc false
  def hpyaxvi_mut1 do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "HpyAXVI-mut1",
      pattern: "crttaa"
    }
  end

  @doc false
  def hpyaxvi_mut2 do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "HpyAXVI-mut2",
      pattern: "crtcna"
    }
  end

  @doc false
  def hpyaxviii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "HpyAXVIII",
      pattern: "ggannag"
    }
  end

  @doc false
  def hpyas001vi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "HpyAS001VI",
      pattern: "cyannnnnnttc"
    }
  end

  @doc false
  def hpych4iii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 3,
      cut_2: 2,
      cut_3: 0,
      cut_4: 0,
      name: "HpyCH4III",
      pattern: "acngt"
    }
  end

  @doc false
  def hpych4iv do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "HpyCH4IV",
      pattern: "acgt"
    }
  end

  @doc false
  def hpych4v do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 2,
      cut_2: 2,
      cut_3: 0,
      cut_4: 0,
      name: "HpyCH4V",
      pattern: "tgca"
    }
  end

  @doc false
  def hpyf3i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "HpyF3I",
      pattern: "ctnag"
    }
  end

  @doc false
  def hpyf10vi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 7,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "HpyF10VI",
      pattern: "gcnnnnnnngc"
    }
  end

  @doc false
  def hpylim6xii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "HpyLIM6XII",
      pattern: "cyannnnnntcc"
    }
  end

  @doc false
  def hpypu007xix do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "HpyPU007XIX",
      pattern: "cyannnnnntgy"
    }
  end

  @doc false
  def hpyse526i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "HpySE526I",
      pattern: "acgt"
    }
  end

  @doc false
  def hpyum032xiii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "HpyUM032XIII",
      pattern: "cyannnnnnntrg"
    }
  end

  @doc false
  def hpyum032xiii_mut1 do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "HpyUM032XIII-mut1",
      pattern: "cyannnnnnnttc"
    }
  end

  @doc false
  def hpyum032xiv do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "HpyUM032XIV",
      pattern: "gaaag"
    }
  end

  @doc false
  def hsoii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -9,
      cut_2: -15,
      cut_3: 25,
      cut_4: 19,
      name: "HsoII",
      pattern: "caynnnnnrtg"
    }
  end

  @doc false
  def hso63250iv do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Hso63250IV",
      pattern: "aacnnnnngtt"
    }
  end

  @doc false
  def hso63373iii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Hso63373III",
      pattern: "cgannnnnrtay"
    }
  end

  @doc false
  def hsp92i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "Hsp92I",
      pattern: "grcgyc"
    }
  end

  @doc false
  def hsp92ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 4,
      cut_2: -1,
      cut_3: 0,
      cut_4: 0,
      name: "Hsp92II",
      pattern: "catg"
    }
  end

  @doc false
  def hspai do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "HspAI",
      pattern: "gcgc"
    }
  end

  @doc false
  def hspmhr1ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "HspMHR1II",
      pattern: "gagcagc"
    }
  end

  @doc false
  def jma19592i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Jma19592I",
      pattern: "gtatnac"
    }
  end

  @doc false
  def jma19592ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Jma19592II",
      pattern: "grgcrac"
    }
  end

  @doc false
  def jsp2502ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Jsp2502II",
      pattern: "grngaat"
    }
  end

  @doc false
  def kasi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "KasI",
      pattern: "ggcgcc"
    }
  end

  @doc false
  def kas9737iii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Kas9737III",
      pattern: "cccrag"
    }
  end

  @doc false
  def kfli do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "KflI",
      pattern: "gggwccc"
    }
  end

  @doc false
  def kor51ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Kor51II",
      pattern: "rtcgag"
    }
  end

  @doc false
  def kpni do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 5,
      cut_2: 1,
      cut_3: 0,
      cut_4: 0,
      name: "KpnI",
      pattern: "ggtacc"
    }
  end

  @doc false
  def kpn2i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "Kpn2I",
      pattern: "tccgga"
    }
  end

  @doc false
  def kpn156v do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Kpn156V",
      pattern: "crtgatt"
    }
  end

  @doc false
  def kpn327i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Kpn327I",
      pattern: "gacatc"
    }
  end

  @doc false
  def kpn9178i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Kpn9178I",
      pattern: "gngcgag"
    }
  end

  @doc false
  def kpn9644ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Kpn9644II",
      pattern: "gracrac"
    }
  end

  @doc false
  def kpnnh25iii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "KpnNH25III",
      pattern: "ctrgag"
    }
  end

  @doc false
  def kpnnih30iii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "KpnNIH30III",
      pattern: "gttcnac"
    }
  end

  @doc false
  def kpnnih50i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "KpnNIH50I",
      pattern: "gcyaag"
    }
  end

  @doc false
  def kroi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "KroI",
      pattern: "gccggc"
    }
  end

  @doc false
  def kro7512ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Kro7512II",
      pattern: "arcagkc"
    }
  end

  @doc false
  def kroni do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "KroNI",
      pattern: "gccggc"
    }
  end

  @doc false
  def kspi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 4,
      cut_2: 2,
      cut_3: 0,
      cut_4: 0,
      name: "KspI",
      pattern: "ccgcgg"
    }
  end

  @doc false
  def ksp22i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "Ksp22I",
      pattern: "tgatca"
    }
  end

  @doc false
  def ksp632i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 7,
      cut_2: 10,
      cut_3: 0,
      cut_4: 0,
      name: "Ksp632I",
      pattern: "ctcttc"
    }
  end

  @doc false
  def kspai do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "KspAI",
      pattern: "gttaac"
    }
  end

  @doc false
  def kzo9i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -1,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "Kzo9I",
      pattern: "gatc"
    }
  end

  @doc false
  def lba2029iii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Lba2029III",
      pattern: "cyaaang"
    }
  end

  @doc false
  def lbr124ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Lbr124II",
      pattern: "catcnac"
    }
  end

  @doc false
  def lde4408ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Lde4408II",
      pattern: "acaaag"
    }
  end

  @doc false
  def lgui do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 8,
      cut_2: 11,
      cut_3: 0,
      cut_4: 0,
      name: "LguI",
      pattern: "gctcttc"
    }
  end

  @doc false
  def lla047i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Lla047I",
      pattern: "ctcca"
    }
  end

  @doc false
  def lla047ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Lla047II",
      pattern: "agaag"
    }
  end

  @doc false
  def llag50i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "LlaG50I",
      pattern: "ccgtka"
    }
  end

  @doc false
  def lme32i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Lme32I",
      pattern: "ctycaa"
    }
  end

  @doc false
  def lmni do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 6,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "LmnI",
      pattern: "gctcc"
    }
  end

  @doc false
  def lmo370i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Lmo370I",
      pattern: "agcgccg"
    }
  end

  @doc false
  def lmo911ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Lmo911II",
      pattern: "tagrag"
    }
  end

  @doc false
  def lpl1004ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Lpl1004II",
      pattern: "aggrag"
    }
  end

  @doc false
  def lpni do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "LpnI",
      pattern: "rgcgcy"
    }
  end

  @doc false
  def lpn11417ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Lpn11417II",
      pattern: "acgaat"
    }
  end

  @doc false
  def lpn12272i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Lpn12272I",
      pattern: "gcncaac"
    }
  end

  @doc false
  def lpnpi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 14,
      cut_2: 18,
      cut_3: 0,
      cut_4: 0,
      name: "LpnPI",
      pattern: "ccdg"
    }
  end

  @doc false
  def lra68i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Lra68I",
      pattern: "gttcnag"
    }
  end

  @doc false
  def lsads4i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "LsaDS4I",
      pattern: "tggaat"
    }
  end

  @doc false
  def lsp48iii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Lsp48III",
      pattern: "agcacc"
    }
  end

  @doc false
  def lsp1109i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 13,
      cut_2: 17,
      cut_3: 0,
      cut_4: 0,
      name: "Lsp1109I",
      pattern: "gcagc"
    }
  end

  @doc false
  def lsp6406vi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Lsp6406VI",
      pattern: "cragcac"
    }
  end

  @doc false
  def lwei do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 10,
      cut_2: 14,
      cut_3: 0,
      cut_4: 0,
      name: "LweI",
      pattern: "gcatc"
    }
  end

  @doc false
  def mabi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 6,
      cut_3: 0,
      cut_4: 0,
      name: "MabI",
      pattern: "accwggt"
    }
  end

  @doc false
  def maei do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "MaeI",
      pattern: "ctag"
    }
  end

  @doc false
  def maeii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "MaeII",
      pattern: "acgt"
    }
  end

  @doc false
  def maeiii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "MaeIII",
      pattern: "gtnac"
    }
  end

  @doc false
  def mali do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 2,
      cut_2: 2,
      cut_3: 0,
      cut_4: 0,
      name: "MalI",
      pattern: "gatc"
    }
  end

  @doc false
  def maqi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 28,
      cut_2: 26,
      cut_3: 0,
      cut_4: 0,
      name: "MaqI",
      pattern: "crttgac"
    }
  end

  @doc false
  def maubi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 6,
      cut_3: 0,
      cut_4: 0,
      name: "MauBI",
      pattern: "cgcgcgcg"
    }
  end

  @doc false
  def mba11i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Mba11I",
      pattern: "aggcga"
    }
  end

  @doc false
  def mbii do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "MbiI",
      pattern: "ccgctc"
    }
  end

  @doc false
  def mboi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -1,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "MboI",
      pattern: "gatc"
    }
  end

  @doc false
  def mboii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 13,
      cut_2: 12,
      cut_3: 0,
      cut_4: 0,
      name: "MboII",
      pattern: "gaaga"
    }
  end

  @doc false
  def mcati do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 4,
      cut_2: 2,
      cut_3: 0,
      cut_4: 0,
      name: "McaTI",
      pattern: "gcgcgc"
    }
  end

  @doc false
  def mch946ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Mch946II",
      pattern: "wcgatct"
    }
  end

  @doc false
  def mch10819i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Mch10819I",
      pattern: "cycagcg"
    }
  end

  @doc false
  def mcri do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 4,
      cut_2: 2,
      cut_3: 0,
      cut_4: 0,
      name: "McrI",
      pattern: "cgrycg"
    }
  end

  @doc false
  def mfei do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "MfeI",
      pattern: "caattg"
    }
  end

  @doc false
  def mfli do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "MflI",
      pattern: "rgatcy"
    }
  end

  @doc false
  def mhli do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 5,
      cut_2: 1,
      cut_3: 0,
      cut_4: 0,
      name: "MhlI",
      pattern: "gdgchc"
    }
  end

  @doc false
  def mjaiv do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "MjaIV",
      pattern: "gtnnac"
    }
  end

  @doc false
  def mkadii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "MkaDII",
      pattern: "gagaygt"
    }
  end

  @doc false
  def mla10359i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Mla10359I",
      pattern: "cgannnnnntca"
    }
  end

  @doc false
  def mlsi do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "MlsI",
      pattern: "tggcca"
    }
  end

  @doc false
  def mlui do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "MluI",
      pattern: "acgcgt"
    }
  end

  @doc false
  def mlu211iii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Mlu211III",
      pattern: "agccca"
    }
  end

  @doc false
  def mluci do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -1,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "MluCI",
      pattern: "aatt"
    }
  end

  @doc false
  def mluni do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "MluNI",
      pattern: "tggcca"
    }
  end

  @doc false
  def mlyi do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 10,
      cut_2: 10,
      cut_3: 0,
      cut_4: 0,
      name: "MlyI",
      pattern: "gagtc"
    }
  end

  @doc false
  def mly113i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "Mly113I",
      pattern: "ggcgcc"
    }
  end

  @doc false
  def mmei do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 26,
      cut_2: 24,
      cut_3: 0,
      cut_4: 0,
      name: "MmeI",
      pattern: "tccrac"
    }
  end

  @doc false
  def mnli do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 11,
      cut_2: 10,
      cut_3: 0,
      cut_4: 0,
      name: "MnlI",
      pattern: "cctc"
    }
  end

  @doc false
  def mox20i do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "Mox20I",
      pattern: "tggcca"
    }
  end

  @doc false
  def mph1103i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 5,
      cut_2: 1,
      cut_3: 0,
      cut_4: 0,
      name: "Mph1103I",
      pattern: "atgcat"
    }
  end

  @doc false
  def mrei do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 6,
      cut_3: 0,
      cut_4: 0,
      name: "MreI",
      pattern: "cgccggcg"
    }
  end

  @doc false
  def mroi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "MroI",
      pattern: "tccgga"
    }
  end

  @doc false
  def mroni do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "MroNI",
      pattern: "gccggc"
    }
  end

  @doc false
  def mroxi do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 5,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "MroXI",
      pattern: "gaannnnttc"
    }
  end

  @doc false
  def msci do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "MscI",
      pattern: "tggcca"
    }
  end

  @doc false
  def msei do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "MseI",
      pattern: "ttaa"
    }
  end

  @doc false
  def msli do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 5,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "MslI",
      pattern: "caynnnnrtg"
    }
  end

  @doc false
  def mspi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "MspI",
      pattern: "ccgg"
    }
  end

  @doc false
  def msp20i do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "Msp20I",
      pattern: "tggcca"
    }
  end

  @doc false
  def mspa1i do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "MspA1I",
      pattern: "cmgckg"
    }
  end

  @doc false
  def mspci do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "MspCI",
      pattern: "cttaag"
    }
  end

  @doc false
  def mspf392i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "MspF392I",
      pattern: "cccaatv"
    }
  end

  @doc false
  def mspgi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 5,
      cut_2: 1,
      cut_3: 0,
      cut_4: 0,
      name: "MspGI",
      pattern: "gccggc"
    }
  end

  @doc false
  def mspi7ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "MspI7II",
      pattern: "acgrag"
    }
  end

  @doc false
  def mspi7iv do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "MspI7IV",
      pattern: "gcmgaag"
    }
  end

  @doc false
  def mspji do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 13,
      cut_2: 17,
      cut_3: 0,
      cut_4: 0,
      name: "MspJI",
      pattern: "cnnr"
    }
  end

  @doc false
  def mspr9i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "MspR9I",
      pattern: "ccngg"
    }
  end

  @doc false
  def mspsc27ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "MspSC27II",
      pattern: "ccgcgac"
    }
  end

  @doc false
  def mssi do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 4,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "MssI",
      pattern: "gtttaaac"
    }
  end

  @doc false
  def msti do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "MstI",
      pattern: "tgcgca"
    }
  end

  @doc false
  def mtei do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 4,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "MteI",
      pattern: "gcgcngcgc"
    }
  end

  @doc false
  def mtuhn878ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "MtuHN878II",
      pattern: "cacgcag"
    }
  end

  @doc false
  def muni do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "MunI",
      pattern: "caattg"
    }
  end

  @doc false
  def mvai do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "MvaI",
      pattern: "ccwgg"
    }
  end

  @doc false
  def mva1269i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 7,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "Mva1269I",
      pattern: "gaatgc"
    }
  end

  @doc false
  def mvni do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 2,
      cut_2: 2,
      cut_3: 0,
      cut_4: 0,
      name: "MvnI",
      pattern: "cgcg"
    }
  end

  @doc false
  def mwoi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 7,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "MwoI",
      pattern: "gcnnnnnnngc"
    }
  end

  @doc false
  def naei do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "NaeI",
      pattern: "gccggc"
    }
  end

  @doc false
  def nal45188ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Nal45188II",
      pattern: "accagc"
    }
  end

  @doc false
  def nan12227i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Nan12227I",
      pattern: "ccannnnnntcy"
    }
  end

  @doc false
  def nari do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "NarI",
      pattern: "ggcgcc"
    }
  end

  @doc false
  def nbr128ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Nbr128II",
      pattern: "accgac"
    }
  end

  @doc false
  def ncii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "NciI",
      pattern: "ccsgg"
    }
  end

  @doc false
  def ncoi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "NcoI",
      pattern: "ccatgg"
    }
  end

  @doc false
  def ndei do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "NdeI",
      pattern: "catatg"
    }
  end

  @doc false
  def ndeii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -1,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "NdeII",
      pattern: "gatc"
    }
  end

  @doc false
  def ngoavii do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 12,
      cut_2: 12,
      cut_3: 0,
      cut_4: 0,
      name: "NgoAVII",
      pattern: "gccgc"
    }
  end

  @doc false
  def ngoaviii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -13,
      cut_2: -15,
      cut_3: 24,
      cut_4: 22,
      name: "NgoAVIII",
      pattern: "gacnnnnntga"
    }
  end

  @doc false
  def ngomiv do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "NgoMIV",
      pattern: "gccggc"
    }
  end

  @doc false
  def nhaxi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "NhaXI",
      pattern: "caagrag"
    }
  end

  @doc false
  def nhei do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "NheI",
      pattern: "gctagc"
    }
  end

  @doc false
  def nhoi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "NhoI",
      pattern: "gcwgc"
    }
  end

  @doc false
  def nlaiii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 4,
      cut_2: -1,
      cut_3: 0,
      cut_4: 0,
      name: "NlaIII",
      pattern: "catg"
    }
  end

  @doc false
  def nlaiv do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "NlaIV",
      pattern: "ggnncc"
    }
  end

  @doc false
  def nlaci do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 25,
      cut_2: 23,
      cut_3: 0,
      cut_4: 0,
      name: "NlaCI",
      pattern: "catcac"
    }
  end

  @doc false
  def nli3877i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 5,
      cut_2: 1,
      cut_3: 0,
      cut_4: 0,
      name: "Nli3877I",
      pattern: "cycgrg"
    }
  end

  @doc false
  def nmeaiii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 27,
      cut_2: 25,
      cut_3: 0,
      cut_4: 0,
      name: "NmeAIII",
      pattern: "gccgag"
    }
  end

  @doc false
  def nmea6ciii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 27,
      cut_2: 25,
      cut_3: 0,
      cut_4: 0,
      name: "NmeA6CIII",
      pattern: "gccgac"
    }
  end

  @doc false
  def nmedi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -13,
      cut_2: -8,
      cut_3: 13,
      cut_4: 18,
      name: "NmeDI",
      pattern: "rccggy"
    }
  end

  @doc false
  def nmuci do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "NmuCI",
      pattern: "gtsac"
    }
  end

  @doc false
  def noti do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 6,
      cut_3: 0,
      cut_4: 0,
      name: "NotI",
      pattern: "gcggccgc"
    }
  end

  @doc false
  def npeus61ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "NpeUS61II",
      pattern: "gatcgac"
    }
  end

  @doc false
  def nrui do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "NruI",
      pattern: "tcgcga"
    }
  end

  @doc false
  def nsbi do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "NsbI",
      pattern: "tgcgca"
    }
  end

  @doc false
  def nsii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 5,
      cut_2: 1,
      cut_3: 0,
      cut_4: 0,
      name: "NsiI",
      pattern: "atgcat"
    }
  end

  @doc false
  def nspi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 5,
      cut_2: 1,
      cut_3: 0,
      cut_4: 0,
      name: "NspI",
      pattern: "rcatgy"
    }
  end

  @doc false
  def nspv do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "NspV",
      pattern: "ttcgaa"
    }
  end

  @doc false
  def nspbii do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "NspBII",
      pattern: "cmgckg"
    }
  end

  @doc false
  def nspes21ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "NspES21II",
      pattern: "crttcag"
    }
  end

  @doc false
  def obabs10i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "ObaBS10I",
      pattern: "acgag"
    }
  end

  @doc false
  def ogri do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "OgrI",
      pattern: "caacnac"
    }
  end

  @doc false
  def olii do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 5,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "OliI",
      pattern: "cacnnnngtg"
    }
  end

  @doc false
  def osphl35iii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "OspHL35III",
      pattern: "yaggag"
    }
  end

  @doc false
  def pabi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 3,
      cut_2: 1,
      cut_3: 0,
      cut_4: 0,
      name: "PabI",
      pattern: "gtac"
    }
  end

  @doc false
  def paci do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 5,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "PacI",
      pattern: "ttaattaa"
    }
  end

  @doc false
  def paciii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "PacIII",
      pattern: "gtaatc"
    }
  end

  @doc false
  def pac19842ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Pac19842II",
      pattern: "ccttga"
    }
  end

  @doc false
  def paei do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 5,
      cut_2: 1,
      cut_3: 0,
      cut_4: 0,
      name: "PaeI",
      pattern: "gcatgc"
    }
  end

  @doc false
  def pae8506i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Pae8506I",
      pattern: "catcgar"
    }
  end

  @doc false
  def pae10662iii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Pae10662III",
      pattern: "tgacgag"
    }
  end

  @doc false
  def paepa99iii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "PaePA99III",
      pattern: "aagayc"
    }
  end

  @doc false
  def paer7i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "PaeR7I",
      pattern: "ctcgag"
    }
  end

  @doc false
  def pagi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "PagI",
      pattern: "tcatga"
    }
  end

  @doc false
  def pal408i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Pal408I",
      pattern: "ccrtgag"
    }
  end

  @doc false
  def palai do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 6,
      cut_3: 0,
      cut_4: 0,
      name: "PalAI",
      pattern: "ggcgcgcc"
    }
  end

  @doc false
  def paqci do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 11,
      cut_2: 15,
      cut_3: 0,
      cut_4: 0,
      name: "PaqCI",
      pattern: "cacctgc"
    }
  end

  @doc false
  def pasi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "PasI",
      pattern: "cccwggg"
    }
  end

  @doc false
  def paui do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "PauI",
      pattern: "gcgcgc"
    }
  end

  @doc false
  def pba2294i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Pba2294I",
      pattern: "gtaag"
    }
  end

  @doc false
  def pbu13063ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Pbu13063II",
      pattern: "gtatyc"
    }
  end

  @doc false
  def pcaii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "PcaII",
      pattern: "gacgag"
    }
  end

  @doc false
  def pcei do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "PceI",
      pattern: "aggcct"
    }
  end

  @doc false
  def pcii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "PciI",
      pattern: "acatgt"
    }
  end

  @doc false
  def pcisi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 8,
      cut_2: 11,
      cut_3: 0,
      cut_4: 0,
      name: "PciSI",
      pattern: "gctcttc"
    }
  end

  @doc false
  def pcr308ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Pcr308II",
      pattern: "ccaaag"
    }
  end

  @doc false
  def pcsi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 7,
      cut_2: 6,
      cut_3: 0,
      cut_4: 0,
      name: "PcsI",
      pattern: "wcgnnnnnnncgw"
    }
  end

  @doc false
  def pcti do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 7,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "PctI",
      pattern: "gaatgc"
    }
  end

  @doc false
  def pdii do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "PdiI",
      pattern: "gccggc"
    }
  end

  @doc false
  def pdi8503iii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Pdi8503III",
      pattern: "ccggnag"
    }
  end

  @doc false
  def pdmi do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 5,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "PdmI",
      pattern: "gaannnnttc"
    }
  end

  @doc false
  def pdu1735i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Pdu1735I",
      pattern: "caccac"
    }
  end

  @doc false
  def peni do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "PenI",
      pattern: "gcagt"
    }
  end

  @doc false
  def pfei do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "PfeI",
      pattern: "gawtc"
    }
  end

  @doc false
  def pfl23ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "Pfl23II",
      pattern: "cgtacg"
    }
  end

  @doc false
  def pfl1108i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Pfl1108I",
      pattern: "tcgtag"
    }
  end

  @doc false
  def pfl3756ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Pfl3756II",
      pattern: "ccctnag"
    }
  end

  @doc false
  def pfl8569i do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "Pfl8569I",
      pattern: "gcnngc"
    }
  end

  @doc false
  def pfl10783ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Pfl10783II",
      pattern: "gcgtcag"
    }
  end

  @doc false
  def pflfi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 4,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "PflFI",
      pattern: "gacnnngtc"
    }
  end

  @doc false
  def pflmi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 7,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "PflMI",
      pattern: "ccannnnntgg"
    }
  end

  @doc false
  def pflpt14i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "PflPt14I",
      pattern: "rgcccac"
    }
  end

  @doc false
  def pfoi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 6,
      cut_3: 0,
      cut_4: 0,
      name: "PfoI",
      pattern: "tccngga"
    }
  end

  @doc false
  def pfrjs12iv do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "PfrJS12IV",
      pattern: "tanaag"
    }
  end

  @doc false
  def pfrjs12v do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "PfrJS12V",
      pattern: "ggcggag"
    }
  end

  @doc false
  def pfrjs15iii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "PfrJS15III",
      pattern: "cttcnac"
    }
  end

  @doc false
  def pinai do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "PinAI",
      pattern: "accggt"
    }
  end

  @doc false
  def pin17fiii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Pin17FIII",
      pattern: "ggygab"
    }
  end

  @doc false
  def pinp23ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "PinP23II",
      pattern: "ctrkcag"
    }
  end

  @doc false
  def pinp59iii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "PinP59III",
      pattern: "gaagnag"
    }
  end

  @doc false
  def pkri do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 3,
      cut_2: 2,
      cut_3: 0,
      cut_4: 0,
      name: "PkrI",
      pattern: "gcngc"
    }
  end

  @doc false
  def pladi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 27,
      cut_2: 25,
      cut_3: 0,
      cut_4: 0,
      name: "PlaDI",
      pattern: "catcag"
    }
  end

  @doc false
  def plei do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 9,
      cut_2: 10,
      cut_3: 0,
      cut_4: 0,
      name: "PleI",
      pattern: "gagtc"
    }
  end

  @doc false
  def ple19i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 4,
      cut_2: 2,
      cut_3: 0,
      cut_4: 0,
      name: "Ple19I",
      pattern: "cgatcg"
    }
  end

  @doc false
  def plimi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "PliMI",
      pattern: "cgccgac"
    }
  end

  @doc false
  def pluti do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 5,
      cut_2: 1,
      cut_3: 0,
      cut_4: 0,
      name: "PluTI",
      pattern: "ggcgcc"
    }
  end

  @doc false
  def pmaci do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "PmaCI",
      pattern: "cacgtg"
    }
  end

  @doc false
  def pmei do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 4,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "PmeI",
      pattern: "gtttaaac"
    }
  end

  @doc false
  def pme10899i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Pme10899I",
      pattern: "gacagg"
    }
  end

  @doc false
  def pmli do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "PmlI",
      pattern: "cacgtg"
    }
  end

  @doc false
  def ppii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -8,
      cut_2: -13,
      cut_3: 25,
      cut_4: 20,
      name: "PpiI",
      pattern: "gaacnnnnnctc"
    }
  end

  @doc false
  def ppip13ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "PpiP13II",
      pattern: "cgcrgac"
    }
  end

  @doc false
  def ppsi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 9,
      cut_2: 10,
      cut_3: 0,
      cut_4: 0,
      name: "PpsI",
      pattern: "gagtc"
    }
  end

  @doc false
  def ppu10i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "Ppu10I",
      pattern: "atgcat"
    }
  end

  @doc false
  def ppu21i do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "Ppu21I",
      pattern: "yacgtr"
    }
  end

  @doc false
  def ppumi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "PpuMI",
      pattern: "rggwccy"
    }
  end

  @doc false
  def pru8113i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Pru8113I",
      pattern: "cagangc"
    }
  end

  @doc false
  def psci do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "PscI",
      pattern: "acatgt"
    }
  end

  @doc false
  def pse18267i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Pse18267I",
      pattern: "rccgaag"
    }
  end

  @doc false
  def pshai do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 5,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "PshAI",
      pattern: "gacnnnngtc"
    }
  end

  @doc false
  def pshbi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "PshBI",
      pattern: "attaat"
    }
  end

  @doc false
  def psii do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "PsiI",
      pattern: "ttataa"
    }
  end

  @doc false
  def psp03i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 4,
      cut_2: 1,
      cut_3: 0,
      cut_4: 0,
      name: "Psp03I",
      pattern: "ggwcc"
    }
  end

  @doc false
  def psp5ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "Psp5II",
      pattern: "rggwccy"
    }
  end

  @doc false
  def psp6i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "Psp6I",
      pattern: "ccwgg"
    }
  end

  @doc false
  def psp0357ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Psp0357II",
      pattern: "gcgaag"
    }
  end

  @doc false
  def psp1406i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "Psp1406I",
      pattern: "aacgtt"
    }
  end

  @doc false
  def psp124bi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 5,
      cut_2: 1,
      cut_3: 0,
      cut_4: 0,
      name: "Psp124BI",
      pattern: "gagctc"
    }
  end

  @doc false
  def pspci do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "PspCI",
      pattern: "cacgtg"
    }
  end

  @doc false
  def pspd7dii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "PspD7DII",
      pattern: "ccgcgag"
    }
  end

  @doc false
  def pspei do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 6,
      cut_3: 0,
      cut_4: 0,
      name: "PspEI",
      pattern: "ggtnacc"
    }
  end

  @doc false
  def pspfi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "PspFI",
      pattern: "cccagc"
    }
  end

  @doc false
  def pspgi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "PspGI",
      pattern: "ccwgg"
    }
  end

  @doc false
  def pspli do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "PspLI",
      pattern: "cgtacg"
    }
  end

  @doc false
  def pspn4i do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "PspN4I",
      pattern: "ggnncc"
    }
  end

  @doc false
  def pspomi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "PspOMI",
      pattern: "gggccc"
    }
  end

  @doc false
  def pspomii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 27,
      cut_2: 25,
      cut_3: 0,
      cut_4: 0,
      name: "PspOMII",
      pattern: "cgcccar"
    }
  end

  @doc false
  def psppi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "PspPI",
      pattern: "ggncc"
    }
  end

  @doc false
  def pspppi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "PspPPI",
      pattern: "rggwccy"
    }
  end

  @doc false
  def psppri do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 21,
      cut_2: 19,
      cut_3: 0,
      cut_4: 0,
      name: "PspPRI",
      pattern: "ccycag"
    }
  end

  @doc false
  def pspr84i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "PspR84I",
      pattern: "tacycac"
    }
  end

  @doc false
  def pspxi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 6,
      cut_3: 0,
      cut_4: 0,
      name: "PspXI",
      pattern: "vctcgagb"
    }
  end

  @doc false
  def psri do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -8,
      cut_2: -13,
      cut_3: 25,
      cut_4: 20,
      name: "PsrI",
      pattern: "gaacnnnnnntac"
    }
  end

  @doc false
  def pssi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 5,
      cut_2: 2,
      cut_3: 0,
      cut_4: 0,
      name: "PssI",
      pattern: "rggnccy"
    }
  end

  @doc false
  def psti do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 5,
      cut_2: 1,
      cut_3: 0,
      cut_4: 0,
      name: "PstI",
      pattern: "ctgcag"
    }
  end

  @doc false
  def pst145i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Pst145I",
      pattern: "ctamrag"
    }
  end

  @doc false
  def pst273i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Pst273I",
      pattern: "gatcgag"
    }
  end

  @doc false
  def pst14472i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Pst14472I",
      pattern: "cnyacac"
    }
  end

  @doc false
  def pstni do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 6,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "PstNI",
      pattern: "cagnnnctg"
    }
  end

  @doc false
  def psui do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "PsuI",
      pattern: "rgatcy"
    }
  end

  @doc false
  def psugi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "PsuGI",
      pattern: "bbcgd"
    }
  end

  @doc false
  def psyi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 4,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "PsyI",
      pattern: "gacnnngtc"
    }
  end

  @doc false
  def ptei do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "PteI",
      pattern: "gcgcgc"
    }
  end

  @doc false
  def pvui do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 4,
      cut_2: 2,
      cut_3: 0,
      cut_4: 0,
      name: "PvuI",
      pattern: "cgatcg"
    }
  end

  @doc false
  def pvuii do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "PvuII",
      pattern: "cagctg"
    }
  end

  @doc false
  def ran11014iv do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Ran11014IV",
      pattern: "gaaagag"
    }
  end

  @doc false
  def rba2021i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Rba2021I",
      pattern: "cacgagh"
    }
  end

  @doc false
  def rcei do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 27,
      cut_2: 25,
      cut_3: 0,
      cut_4: 0,
      name: "RceI",
      pattern: "catcgac"
    }
  end

  @doc false
  def rdegbi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "RdeGBI",
      pattern: "ccgcag"
    }
  end

  @doc false
  def rdegbii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 26,
      cut_2: 24,
      cut_3: 0,
      cut_4: 0,
      name: "RdeGBII",
      pattern: "acccag"
    }
  end

  @doc false
  def rdegbiii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -10,
      cut_2: -12,
      cut_3: 17,
      cut_4: 15,
      name: "RdeGBIII",
      pattern: "tgryca"
    }
  end

  @doc false
  def rer8036ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Rer8036II",
      pattern: "ccgakgg"
    }
  end

  @doc false
  def rflfiii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "RflFIII",
      pattern: "cgccag"
    }
  end

  @doc false
  def rgai do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 5,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "RgaI",
      pattern: "gcgatcgc"
    }
  end

  @doc false
  def rgo13296iv do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Rgo13296IV",
      pattern: "graagcg"
    }
  end

  @doc false
  def rho5650i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Rho5650I",
      pattern: "aacgag"
    }
  end

  @doc false
  def rigi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 6,
      cut_2: 2,
      cut_3: 0,
      cut_4: 0,
      name: "RigI",
      pattern: "ggccggcc"
    }
  end

  @doc false
  def rkr11038i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Rkr11038I",
      pattern: "ggannnnnrtga"
    }
  end

  @doc false
  def rlai do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "RlaI",
      pattern: "vcw"
    }
  end

  @doc false
  def rlaii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 26,
      cut_2: 24,
      cut_3: 0,
      cut_4: 0,
      name: "RlaII",
      pattern: "acacag"
    }
  end

  @doc false
  def rleai do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 18,
      cut_2: 15,
      cut_3: 0,
      cut_4: 0,
      name: "RleAI",
      pattern: "cccaca"
    }
  end

  @doc false
  def rmu369iii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Rmu369III",
      pattern: "ggcyac"
    }
  end

  @doc false
  def rpai do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 18,
      cut_2: 16,
      cut_3: 0,
      cut_4: 0,
      name: "RpaI",
      pattern: "gtyggag"
    }
  end

  @doc false
  def rpabi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 27,
      cut_2: 25,
      cut_3: 0,
      cut_4: 0,
      name: "RpaBI",
      pattern: "cccgcag"
    }
  end

  @doc false
  def rpab5i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 27,
      cut_2: 25,
      cut_3: 0,
      cut_4: 0,
      name: "RpaB5I",
      pattern: "cgrggac"
    }
  end

  @doc false
  def rpati do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "RpaTI",
      pattern: "grtggag"
    }
  end

  @doc false
  def rrui do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "RruI",
      pattern: "tcgcga"
    }
  end

  @doc false
  def rsai do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 2,
      cut_2: 2,
      cut_3: 0,
      cut_4: 0,
      name: "RsaI",
      pattern: "gtac"
    }
  end

  @doc false
  def rsani do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "RsaNI",
      pattern: "gtac"
    }
  end

  @doc false
  def rsei do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 5,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "RseI",
      pattern: "caynnnnrtg"
    }
  end

  @doc false
  def rsp008iv do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Rsp008IV",
      pattern: "acgcag"
    }
  end

  @doc false
  def rsp008v do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Rsp008V",
      pattern: "gcccat"
    }
  end

  @doc false
  def rsp531ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Rsp531II",
      pattern: "cacacg"
    }
  end

  @doc false
  def rsppbts2iii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "RspPBTS2III",
      pattern: "cttcgag"
    }
  end

  @doc false
  def rsrii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "RsrII",
      pattern: "cggwccg"
    }
  end

  @doc false
  def rsr2i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "Rsr2I",
      pattern: "cggwccg"
    }
  end

  @doc false
  def rtr1953i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Rtr1953I",
      pattern: "tgannnnnntga"
    }
  end

  @doc false
  def saci do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 5,
      cut_2: 1,
      cut_3: 0,
      cut_4: 0,
      name: "SacI",
      pattern: "gagctc"
    }
  end

  @doc false
  def sacii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 4,
      cut_2: 2,
      cut_3: 0,
      cut_4: 0,
      name: "SacII",
      pattern: "ccgcgg"
    }
  end

  @doc false
  def saf8902iii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Saf8902III",
      pattern: "caatnag"
    }
  end

  @doc false
  def sag901i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Sag901I",
      pattern: "gcaaat"
    }
  end

  @doc false
  def sali do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "SalI",
      pattern: "gtcgac"
    }
  end

  @doc false
  def sandi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "SanDI",
      pattern: "gggwccc"
    }
  end

  @doc false
  def sapi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 8,
      cut_2: 11,
      cut_3: 0,
      cut_4: 0,
      name: "SapI",
      pattern: "gctcttc"
    }
  end

  @doc false
  def saqai do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "SaqAI",
      pattern: "ttaa"
    }
  end

  @doc false
  def sati do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "SatI",
      pattern: "gcngc"
    }
  end

  @doc false
  def saui do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "SauI",
      pattern: "cctnagg"
    }
  end

  @doc false
  def sau96i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "Sau96I",
      pattern: "ggncc"
    }
  end

  @doc false
  def sau1803iii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Sau1803III",
      pattern: "cgannnnnntac"
    }
  end

  @doc false
  def sau5656ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Sau5656II",
      pattern: "gttgca"
    }
  end

  @doc false
  def sau64037iv do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Sau64037IV",
      pattern: "gtannnnnntgg"
    }
  end

  @doc false
  def sau3ai do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -1,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "Sau3AI",
      pattern: "gatc"
    }
  end

  @doc false
  def saumj015iii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "SauMJ015III",
      pattern: "garcnag"
    }
  end

  @doc false
  def sba460ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Sba460II",
      pattern: "ggngayg"
    }
  end

  @doc false
  def sbfi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 6,
      cut_2: 2,
      cut_3: 0,
      cut_4: 0,
      name: "SbfI",
      pattern: "cctgcagg"
    }
  end

  @doc false
  def sbo46i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Sbo46I",
      pattern: "tgaac"
    }
  end

  @doc false
  def scai do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "ScaI",
      pattern: "agtact"
    }
  end

  @doc false
  def schi do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 10,
      cut_2: 10,
      cut_3: 0,
      cut_4: 0,
      name: "SchI",
      pattern: "gagtc"
    }
  end

  @doc false
  def scii do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "SciI",
      pattern: "ctcgag"
    }
  end

  @doc false
  def scods2ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "ScoDS2II",
      pattern: "gctaat"
    }
  end

  @doc false
  def scrfi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "ScrFI",
      pattern: "ccngg"
    }
  end

  @doc false
  def sdai do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 6,
      cut_2: 2,
      cut_3: 0,
      cut_4: 0,
      name: "SdaI",
      pattern: "cctgcagg"
    }
  end

  @doc false
  def sdeai do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 27,
      cut_2: 25,
      cut_3: 0,
      cut_4: 0,
      name: "SdeAI",
      pattern: "cagrag"
    }
  end

  @doc false
  def sdeosi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -12,
      cut_2: -14,
      cut_3: 23,
      cut_4: 21,
      name: "SdeOSI",
      pattern: "gacnnnnrtga"
    }
  end

  @doc false
  def sdui do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 5,
      cut_2: 1,
      cut_3: 0,
      cut_4: 0,
      name: "SduI",
      pattern: "gdgchc"
    }
  end

  @doc false
  def sdy5370i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Sdy5370I",
      pattern: "cacnnnnntcy"
    }
  end

  @doc false
  def sdy7136i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Sdy7136I",
      pattern: "gagnnnnntaa"
    }
  end

  @doc false
  def sdy9603i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Sdy9603I",
      pattern: "gcannnnnnntga"
    }
  end

  @doc false
  def seci do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "SecI",
      pattern: "ccnngg"
    }
  end

  @doc false
  def seli do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -1,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "SelI",
      pattern: "cgcg"
    }
  end

  @doc false
  def sen5794iii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Sen5794III",
      pattern: "acgaacb"
    }
  end

  @doc false
  def sen6480iv do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Sen6480IV",
      pattern: "gttcat"
    }
  end

  @doc false
  def sen17963iii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Sen17963III",
      pattern: "ccaaac"
    }
  end

  @doc false
  def sena1673iii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "SenA1673III",
      pattern: "gnggcag"
    }
  end

  @doc false
  def sensara26iii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "SenSARA26III",
      pattern: "acrcag"
    }
  end

  @doc false
  def sentfiv do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "SenTFIV",
      pattern: "gatcag"
    }
  end

  @doc false
  def sep11964i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Sep11964I",
      pattern: "cgycat"
    }
  end

  @doc false
  def seti do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 4,
      cut_2: -1,
      cut_3: 0,
      cut_4: 0,
      name: "SetI",
      pattern: "asst"
    }
  end

  @doc false
  def sexai do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 6,
      cut_3: 0,
      cut_4: 0,
      name: "SexAI",
      pattern: "accwggt"
    }
  end

  @doc false
  def sfaai do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 5,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "SfaAI",
      pattern: "gcgatcgc"
    }
  end

  @doc false
  def sfani do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 10,
      cut_2: 14,
      cut_3: 0,
      cut_4: 0,
      name: "SfaNI",
      pattern: "gcatc"
    }
  end

  @doc false
  def sfci do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "SfcI",
      pattern: "ctryag"
    }
  end

  @doc false
  def sfei do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "SfeI",
      pattern: "ctryag"
    }
  end

  @doc false
  def sfii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 8,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "SfiI",
      pattern: "ggccnnnnnggcc"
    }
  end

  @doc false
  def sfl13829iii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Sfl13829III",
      pattern: "gnycag"
    }
  end

  @doc false
  def sfoi do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "SfoI",
      pattern: "ggcgcc"
    }
  end

  @doc false
  def sfr274i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "Sfr274I",
      pattern: "ctcgag"
    }
  end

  @doc false
  def sfr303i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 4,
      cut_2: 2,
      cut_3: 0,
      cut_4: 0,
      name: "Sfr303I",
      pattern: "ccgcgg"
    }
  end

  @doc false
  def sfui do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "SfuI",
      pattern: "ttcgaa"
    }
  end

  @doc false
  def sgei do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 13,
      cut_2: 17,
      cut_3: 0,
      cut_4: 0,
      name: "SgeI",
      pattern: "cnng"
    }
  end

  @doc false
  def sgfi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 5,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "SgfI",
      pattern: "gcgatcgc"
    }
  end

  @doc false
  def sgr7807i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Sgr7807I",
      pattern: "gccgagg"
    }
  end

  @doc false
  def sgrai do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 6,
      cut_3: 0,
      cut_4: 0,
      name: "SgrAI",
      pattern: "crccggyg"
    }
  end

  @doc false
  def sgraii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "SgrAII",
      pattern: "cgagatc"
    }
  end

  @doc false
  def sgrbi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 4,
      cut_2: 2,
      cut_3: 0,
      cut_4: 0,
      name: "SgrBI",
      pattern: "ccgcgg"
    }
  end

  @doc false
  def sgrdi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 6,
      cut_3: 0,
      cut_4: 0,
      name: "SgrDI",
      pattern: "cgtcgacg"
    }
  end

  @doc false
  def sgrti do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 14,
      cut_2: 18,
      cut_3: 0,
      cut_4: 0,
      name: "SgrTI",
      pattern: "ccds"
    }
  end

  @doc false
  def sgsi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 6,
      cut_3: 0,
      cut_4: 0,
      name: "SgsI",
      pattern: "ggcgcgcc"
    }
  end

  @doc false
  def simi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "SimI",
      pattern: "gggtc"
    }
  end

  @doc false
  def sini do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "SinI",
      pattern: "ggwcc"
    }
  end

  @doc false
  def slai do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "SlaI",
      pattern: "ctcgag"
    }
  end

  @doc false
  def smai do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "SmaI",
      pattern: "cccggg"
    }
  end

  @doc false
  def sma325i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Sma325I",
      pattern: "arccct"
    }
  end

  @doc false
  def sma10259ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Sma10259II",
      pattern: "caaaga"
    }
  end

  @doc false
  def smaumh5i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "SmaUMH5I",
      pattern: "cttgac"
    }
  end

  @doc false
  def smaumh8i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "SmaUMH8I",
      pattern: "gcgaacb"
    }
  end

  @doc false
  def smii do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 4,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "SmiI",
      pattern: "atttaaat"
    }
  end

  @doc false
  def smimi do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 5,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "SmiMI",
      pattern: "caynnnnrtg"
    }
  end

  @doc false
  def smli do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "SmlI",
      pattern: "ctyrag"
    }
  end

  @doc false
  def smoi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "SmoI",
      pattern: "ctyrag"
    }
  end

  @doc false
  def snai do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "SnaI",
      pattern: "gtatac"
    }
  end

  @doc false
  def sna507viii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Sna507VIII",
      pattern: "crttgag"
    }
  end

  @doc false
  def snabi do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "SnaBI",
      pattern: "tacgta"
    }
  end

  @doc false
  def sno506i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Sno506I",
      pattern: "ggccgag"
    }
  end

  @doc false
  def spei do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "SpeI",
      pattern: "actagt"
    }
  end

  @doc false
  def spe19205iv do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Spe19205IV",
      pattern: "ggacy"
    }
  end

  @doc false
  def sphi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 5,
      cut_2: 1,
      cut_3: 0,
      cut_4: 0,
      name: "SphI",
      pattern: "gcatgc"
    }
  end

  @doc false
  def spli do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "SplI",
      pattern: "cgtacg"
    }
  end

  @doc false
  def spnrii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "SpnRII",
      pattern: "tcgag"
    }
  end

  @doc false
  def spodi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "SpoDI",
      pattern: "gcggrag"
    }
  end

  @doc false
  def srfi do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 4,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "SrfI",
      pattern: "gcccgggc"
    }
  end

  @doc false
  def sse9i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -1,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "Sse9I",
      pattern: "aatt"
    }
  end

  @doc false
  def sse232i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 6,
      cut_3: 0,
      cut_4: 0,
      name: "Sse232I",
      pattern: "cgccggcg"
    }
  end

  @doc false
  def sse8387i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 6,
      cut_2: 2,
      cut_3: 0,
      cut_4: 0,
      name: "Sse8387I",
      pattern: "cctgcagg"
    }
  end

  @doc false
  def sse8647i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "Sse8647I",
      pattern: "aggwcct"
    }
  end

  @doc false
  def ssebi do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "SseBI",
      pattern: "aggcct"
    }
  end

  @doc false
  def ssii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "SsiI",
      pattern: "ccgc"
    }
  end

  @doc false
  def sspi do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "SspI",
      pattern: "aatatt"
    }
  end

  @doc false
  def ssp714ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Ssp714II",
      pattern: "cgcagcg"
    }
  end

  @doc false
  def ssp6803iv do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Ssp6803IV",
      pattern: "gaaggc"
    }
  end

  @doc false
  def sspdi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "SspDI",
      pattern: "ggcgcc"
    }
  end

  @doc false
  def sspd5i do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 13,
      cut_2: 13,
      cut_3: 0,
      cut_4: 0,
      name: "SspD5I",
      pattern: "ggtga"
    }
  end

  @doc false
  def sspjor1ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "SspJOR1II",
      pattern: "agcganc"
    }
  end

  @doc false
  def sspmi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "SspMI",
      pattern: "ctag"
    }
  end

  @doc false
  def ssti do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 5,
      cut_2: 1,
      cut_3: 0,
      cut_4: 0,
      name: "SstI",
      pattern: "gagctc"
    }
  end

  @doc false
  def sste37i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 27,
      cut_2: 25,
      cut_3: 0,
      cut_4: 0,
      name: "SstE37I",
      pattern: "cgaagac"
    }
  end

  @doc false
  def sth132i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 8,
      cut_2: 12,
      cut_3: 0,
      cut_4: 0,
      name: "Sth132I",
      pattern: "cccg"
    }
  end

  @doc false
  def sth302ii do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 2,
      cut_2: 2,
      cut_3: 0,
      cut_4: 0,
      name: "Sth302II",
      pattern: "ccgg"
    }
  end

  @doc false
  def sth20745iii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Sth20745III",
      pattern: "ggacgac"
    }
  end

  @doc false
  def sthst3ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "SthSt3II",
      pattern: "gaagt"
    }
  end

  @doc false
  def stsi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 15,
      cut_2: 19,
      cut_3: 0,
      cut_4: 0,
      name: "StsI",
      pattern: "ggatg"
    }
  end

  @doc false
  def stui do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "StuI",
      pattern: "aggcct"
    }
  end

  @doc false
  def styi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "StyI",
      pattern: "ccwwgg"
    }
  end

  @doc false
  def styd4i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "StyD4I",
      pattern: "ccngg"
    }
  end

  @doc false
  def surp32aii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "SurP32aII",
      pattern: "acrgag"
    }
  end

  @doc false
  def swai do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 4,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "SwaI",
      pattern: "atttaaat"
    }
  end

  @doc false
  def taai do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 3,
      cut_2: 2,
      cut_3: 0,
      cut_4: 0,
      name: "TaaI",
      pattern: "acngt"
    }
  end

  @doc false
  def tagi do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 2,
      cut_2: 2,
      cut_3: 0,
      cut_4: 0,
      name: "TagI",
      pattern: "acgt"
    }
  end

  @doc false
  def taii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 4,
      cut_2: -1,
      cut_3: 0,
      cut_4: 0,
      name: "TaiI",
      pattern: "acgt"
    }
  end

  @doc false
  def taqi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "TaqI",
      pattern: "tcga"
    }
  end

  @doc false
  def taqii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 17,
      cut_2: 15,
      cut_3: 0,
      cut_4: 0,
      name: "TaqII",
      pattern: "gaccga"
    }
  end

  @doc false
  def taqiii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 17,
      cut_2: 15,
      cut_3: 0,
      cut_4: 0,
      name: "TaqIII",
      pattern: "caccca"
    }
  end

  @doc false
  def tasi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -1,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "TasI",
      pattern: "aatt"
    }
  end

  @doc false
  def tati do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "TatI",
      pattern: "wgtacw"
    }
  end

  @doc false
  def taui do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 4,
      cut_2: 1,
      cut_3: 0,
      cut_4: 0,
      name: "TauI",
      pattern: "gcsgc"
    }
  end

  @doc false
  def tfii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "TfiI",
      pattern: "gawtc"
    }
  end

  @doc false
  def tkoi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 26,
      cut_2: 24,
      cut_3: 0,
      cut_4: 0,
      name: "TkoI",
      pattern: "gtgaag"
    }
  end

  @doc false
  def tkoii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 16,
      cut_2: 14,
      cut_3: 0,
      cut_4: 0,
      name: "TkoII",
      pattern: "ttcaag"
    }
  end

  @doc false
  def tpytp2i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "TpyTP2I",
      pattern: "accaag"
    }
  end

  @doc false
  def tru1i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "Tru1I",
      pattern: "ttaa"
    }
  end

  @doc false
  def tru9i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "Tru9I",
      pattern: "ttaa"
    }
  end

  @doc false
  def tscai do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 7,
      cut_2: -3,
      cut_3: 0,
      cut_4: 0,
      name: "TscAI",
      pattern: "castg"
    }
  end

  @doc false
  def tsei do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "TseI",
      pattern: "gcwgc"
    }
  end

  @doc false
  def tsefi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "TseFI",
      pattern: "gtsac"
    }
  end

  @doc false
  def tsoi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 17,
      cut_2: 15,
      cut_3: 0,
      cut_4: 0,
      name: "TsoI",
      pattern: "tarcca"
    }
  end

  @doc false
  def tsp45i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "Tsp45I",
      pattern: "gtsac"
    }
  end

  @doc false
  def tsparh3i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "TspARh3I",
      pattern: "gracgac"
    }
  end

  @doc false
  def tsp4ci do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 3,
      cut_2: 2,
      cut_3: 0,
      cut_4: 0,
      name: "Tsp4CI",
      pattern: "acngt"
    }
  end

  @doc false
  def tspdti do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 16,
      cut_2: 14,
      cut_3: 0,
      cut_4: 0,
      name: "TspDTI",
      pattern: "atgaa"
    }
  end

  @doc false
  def tspei do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -1,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "TspEI",
      pattern: "aatt"
    }
  end

  @doc false
  def tspgwi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 16,
      cut_2: 14,
      cut_3: 0,
      cut_4: 0,
      name: "TspGWI",
      pattern: "acgga"
    }
  end

  @doc false
  def tspmi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "TspMI",
      pattern: "cccggg"
    }
  end

  @doc false
  def tspri do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 7,
      cut_2: -3,
      cut_3: 0,
      cut_4: 0,
      name: "TspRI",
      pattern: "castg"
    }
  end

  @doc false
  def tssi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "TssI",
      pattern: "gagnnnctc"
    }
  end

  @doc false
  def tsti do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -9,
      cut_2: -14,
      cut_3: 24,
      cut_4: 19,
      name: "TstI",
      pattern: "cacnnnnnntcc"
    }
  end

  @doc false
  def tsui do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "TsuI",
      pattern: "gcgac"
    }
  end

  @doc false
  def tth111i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 4,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "Tth111I",
      pattern: "gacnnngtc"
    }
  end

  @doc false
  def tth111ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 17,
      cut_2: 15,
      cut_3: 0,
      cut_4: 0,
      name: "Tth111II",
      pattern: "caarca"
    }
  end

  @doc false
  def ubaf9i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "UbaF9I",
      pattern: "tacnnnnnrtgt"
    }
  end

  @doc false
  def ubaf11i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "UbaF11I",
      pattern: "tcgta"
    }
  end

  @doc false
  def ubaf12i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "UbaF12I",
      pattern: "ctacnnngtc"
    }
  end

  @doc false
  def ubaf13i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "UbaF13I",
      pattern: "gagnnnnnnctgg"
    }
  end

  @doc false
  def ubaf14i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "UbaF14I",
      pattern: "ccannnnntcg"
    }
  end

  @doc false
  def ubapi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "UbaPI",
      pattern: "cgaacg"
    }
  end

  @doc false
  def ucomsi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -8,
      cut_2: -6,
      cut_3: 11,
      cut_4: 13,
      name: "UcoMSI",
      pattern: "gagctc"
    }
  end

  @doc false
  def unbi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "UnbI",
      pattern: "ggncc"
    }
  end

  @doc false
  def van91i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 7,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "Van91I",
      pattern: "ccannnnntgg"
    }
  end

  @doc false
  def van9116i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Van9116I",
      pattern: "cckaag"
    }
  end

  @doc false
  def vche4ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "VchE4II",
      pattern: "rtaaayg"
    }
  end

  @doc false
  def vdi96ii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Vdi96II",
      pattern: "gncytag"
    }
  end

  @doc false
  def vha464i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "Vha464I",
      pattern: "cttaag"
    }
  end

  @doc false
  def vnei do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "VneI",
      pattern: "gtgcac"
    }
  end

  @doc false
  def vpak11ai do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: -1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "VpaK11AI",
      pattern: "ggwcc"
    }
  end

  @doc false
  def vpak11bi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "VpaK11BI",
      pattern: "ggwcc"
    }
  end

  @doc false
  def vspi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "VspI",
      pattern: "attaat"
    }
  end

  @doc false
  def vtu19109i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Vtu19109I",
      pattern: "cacrayc"
    }
  end

  @doc false
  def wvii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 27,
      cut_2: 25,
      cut_3: 0,
      cut_4: 0,
      name: "WviI",
      pattern: "cacrag"
    }
  end

  @doc false
  def xagi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 5,
      cut_2: 6,
      cut_3: 0,
      cut_4: 0,
      name: "XagI",
      pattern: "cctnnnnnagg"
    }
  end

  @doc false
  def xapi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "XapI",
      pattern: "raatty"
    }
  end

  @doc false
  def xbai do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "XbaI",
      pattern: "tctaga"
    }
  end

  @doc false
  def xca85iv do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Xca85IV",
      pattern: "tacgag"
    }
  end

  @doc false
  def xcei do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 5,
      cut_2: 1,
      cut_3: 0,
      cut_4: 0,
      name: "XceI",
      pattern: "rcatgy"
    }
  end

  @doc false
  def xcmi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 8,
      cut_2: 7,
      cut_3: 0,
      cut_4: 0,
      name: "XcmI",
      pattern: "ccannnnnnnnntgg"
    }
  end

  @doc false
  def xhoi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "XhoI",
      pattern: "ctcgag"
    }
  end

  @doc false
  def xhoii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "XhoII",
      pattern: "rgatcy"
    }
  end

  @doc false
  def xmai do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "XmaI",
      pattern: "cccggg"
    }
  end

  @doc false
  def xmaiii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "XmaIII",
      pattern: "cggccg"
    }
  end

  @doc false
  def xmaji do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "XmaJI",
      pattern: "cctagg"
    }
  end

  @doc false
  def xmii do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 2,
      cut_2: 4,
      cut_3: 0,
      cut_4: 0,
      name: "XmiI",
      pattern: "gtmkac"
    }
  end

  @doc false
  def xmni do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 5,
      cut_2: 5,
      cut_3: 0,
      cut_4: 0,
      name: "XmnI",
      pattern: "gaannnnttc"
    }
  end

  @doc false
  def xspi do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 1,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "XspI",
      pattern: "ctag"
    }
  end

  @doc false
  def ykri do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 11,
      cut_2: 10,
      cut_3: 0,
      cut_4: 0,
      name: "YkrI",
      pattern: "c"
    }
  end

  @doc false
  def yps3606i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Yps3606I",
      pattern: "cggaag"
    }
  end

  @doc false
  def yru12986i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 0,
      cut_2: 0,
      cut_3: 0,
      cut_4: 0,
      name: "Yru12986I",
      pattern: "aggaag"
    }
  end

  @doc false
  def zrai do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "ZraI",
      pattern: "gacgtc"
    }
  end

  @doc false
  def zrmi do
    %Bio.Restriction.Enzyme{
      blunt?: true,
      cut_1: 3,
      cut_2: 3,
      cut_3: 0,
      cut_4: 0,
      name: "ZrmI",
      pattern: "agtact"
    }
  end

  @doc false
  def zsp2i do
    %Bio.Restriction.Enzyme{
      blunt?: false,
      cut_1: 5,
      cut_2: 1,
      cut_3: 0,
      cut_4: 0,
      name: "Zsp2I",
      pattern: "atgcat"
    }
  end
end
