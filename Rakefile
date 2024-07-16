=begin
================================================================================
PML CSS Playground Rakefile v1.0.0 (2024/07/17)
================================================================================
=end

require './_assets/rake/globals.rb'

# ==============================================================================
# --------------------{  P R O J E C T   S E T T I N G S  }---------------------
# ==============================================================================

THEMES_PRFX = "css__"  # the prefix for themes folders names.

# ==============================================================================
# -------------------------------{  T A S K S  }--------------------------------
# ==============================================================================

task :default => :samples


## Clean & Clobber
##################
require 'rake/clean'
CLEAN.include("**/*.html")
CLOBBER.include("#{THEMES_PRFX}*/css/*.css",
                "#{THEMES_PRFX}*/css/*.css.map")
task(:clean).clear_comments
task(:clean).add_description "Delete generated HTML"
task(:clobber).clear_comments
task(:clobber).add_description "Delete compiled CSS"


## Build Samples in Place
#########################

desc "Convert samples in source dir"
task :samples

FileList["samples/*.pml"].each do |src|
  html = src.ext('html')
  task :samples => html
  file html => src
end


## Generate Themes Tasks
########################

THEMES_DIRS = FileList["#{THEMES_PRFX}*/"]

THEMES_DIRS.each do |theme_dir|
  theme = theme_dir.delete_prefix(THEMES_PRFX).chop! # Drop trailing '/'
  scss_dir = "#{theme_dir}sass/"
  scss_main = "#{scss_dir}styles.scss"
  css_dir = "#{theme_dir}css/"
  css_target = "#{css_dir}styles.css"
  # Target CSS *MUST BE* "css/styles.css" because there's no other
  # way to make PMLC link to it (the CLI option seem broken).
  # ====================================
  # Ensure the theme meets requirements!
  # ====================================
  err_sass = false
  err_msg = ""
  unless File.file?(scss_main)
    err_sass = true
    err_msg += "  * missing Sass source: #{scss_main}\n"
  end
  if err_sass
    PrintWarningMessage("Theme \"#{theme}\" won't be processed:\n#{err_msg}")
  else
    # ======================================
    # Build theme task and its related tasks
    # ======================================
    task theme
    Rake::Task[theme].add_description("Build theme: #{theme}")
    task :default => theme
    # ===========================
    # Add Sass conversion to task
    # ===========================
    # For now, a single SCSS source file only!
    task theme => css_target
    sass_deps = FileList["#{scss_dir}**/*.scss", "#{scss_dir}**/*.css"]
    file css_target => sass_deps do |t|
      SassConvert(scss_main, css_target, theme)
    end
    # ============================
    # Add PMLC conversions to task
    # ============================
    FileList[ "samples/*.pml", "#{theme_dir}*.pml"].each do |pml|
      html_fname = pml.pathmap("%n").ext('.html')
      html_f = "#{theme_dir}#{html_fname}"
      task theme => html_f
      file html_f => pml do
        PmlConvertTheme(pml, html_f, "css/styles.css", theme)
      end
    end # <- shared PML files iteration
  end # <- theme validation conditional branch
end # <- themes iteration

# ==============================================================================
# ---------------------------{  F U N C T I O N S  }----------------------------
# ==============================================================================

def SassConvert(srcf, outf, theme)
  TaskHeader "Theme: #{theme} -> Converting Sass to CSS"
  puts "Target: #{outf}\n\n"
  sh "sass #{srcf} #{outf}"
end

def PmlConvertTheme(srcf, outf, cssf = nil, theme)
  # Converts to HTML a shared sample doc or a theme-specific doc for a theme,
  # inside the theme root folder.
  TaskHeader "Theme: #{theme} -> Converting Sample Doc"
  puts "Source: #{srcf}\n"
  puts "Target: #{outf}\n\n"
  srcf_abs = File.expand_path(srcf)
  cd "#{outf.pathmap("%d")}", verbose: false
  sh "pmlc p2h --CSS_files \"#{cssf}\"  --output #{outf.pathmap("%f")} #{srcf_abs}"
  cd $repo_root, verbose: false
end

# ==============================================================================
# -------------------------------{  R U L E S  }--------------------------------
# ==============================================================================

## PML Generic Conversion Rule
##############################

rule '.html' => '.pml' do |t|
  TaskHeader "Converting Reference Sample Doc"
  puts "Sample: #{t.source}\n\n"
  cd "#{t.source.pathmap("%d")}", verbose: false
  sh "pmlc p2h --output #{t.name.pathmap("%f")} #{t.source.pathmap("%f")}"
  cd $repo_root, verbose: false
end
