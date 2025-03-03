#!/usr/bin/env ruby

require 'fileutils'

def setup_lucide
  vendor_dir = "assets/js/vendor"
  FileUtils.mkdir_p(vendor_dir)
  
  lucide_path = "#{vendor_dir}/lucide.js"
  
  # Télécharger Lucide
  system("curl -L https://unpkg.com/lucide/dist/umd/lucide.min.js > #{lucide_path}")
  
  # Supprimer la référence à la source map
  content = File.read(lucide_path)
  content = content.lines[0..-2].join if content.include?('sourceMappingURL')
  File.write(lucide_path, content)
  
  puts "✅ Lucide.js configuré avec succès"
end

begin
  setup_lucide
rescue => e
  puts "❌ Erreur : #{e.message}"
  exit 1
end
