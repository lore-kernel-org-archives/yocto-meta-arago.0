Return-Path: <a0866934local@udb0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 590AF529A9
	for <meta-arago@arago-project.org>;
	Tue, 17 Mar 2015 14:19:01 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2HEJ04A017343
	for <meta-arago@arago-project.org>; Tue, 17 Mar 2015 09:19:00 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2HEIxiF029464
	for <meta-arago@arago-project.org>; Tue, 17 Mar 2015 09:18:59 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 17 Mar 2015 09:18:59 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2HEIxXX022034;
	Tue, 17 Mar 2015 09:18:59 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1YXsKg-0002yg-Nu;
	Tue, 17 Mar 2015 10:18:58 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 17 Mar 2015 10:18:57 -0400
Message-ID: <1426601937-11416-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] tisdk-image: Generate software manifest text file.
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Mar 2015 14:19:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

* The generated text file adheres to the SRAS software manifest format.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/classes/tisdk-image.bbclass |  243 +++++++++++++++++++++----
 1 file changed, 208 insertions(+), 35 deletions(-)

diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-distro/classes/tisdk-image.bbclass
index 747670f..9498f6c 100644
--- a/meta-arago-distro/classes/tisdk-image.bbclass
+++ b/meta-arago-distro/classes/tisdk-image.bbclass
@@ -57,6 +57,7 @@ DEPLOY_SPL_UART_NAME ?= "u-boot-spl.bin-${MACHINE}"
 # This manifest follows the TI manifest format requirements which is why
 # it differs from some of the default manifest code in oe-core.
 SW_MANIFEST_FILE ?= "${IMAGE_ROOTFS}/docs/software_manifest.htm"
+SW_MANIFEST_TEXT ?= "${IMAGE_ROOTFS}/docs/software_manifest.txt"
 
 # helper function for generating a set of strings based on a list.  Taken
 # from the image.bbclass.
@@ -145,21 +146,17 @@ Any use of ECCNs listed in the Manifest is at the user's risk and without recour
 
 <h2><u>Links in the Manifest</u></h2>
 <p>
-Any links appearing on this Manifest (for example in the &ldquo;Obtained from&rdquo field) were verified at the time the Manifest was created.  TI makes no guarantee that any listed links will remain active in the future.
+Any links appearing on this Manifest (for example in the &ldquo;Obtained from&rdquo; field) were verified at the time the Manifest was created.  TI makes no guarantee that any listed links will remain active in the future.
 </p>
 
 <h2><u>Open Source License References</u></h2>
 <p>
-Your company is responsible for confirming the applicable license terms for any open source Software listed in this Manifest that was not &ldquo;Obtained from&rdquo TI.  Any open source license specified in this Manifest for Sotware that was not &ldquo;Obtained from&rdquo TI is for TI's internal use only and shall not be construed as a representation of warranty regarding the proper open source license terms for such Software.
+Your company is responsible for confirming the applicable license terms for any open source Software listed in this Manifest that was not &ldquo;Obtained from&rdquo; TI.  Any open source license specified in this Manifest for Sotware that was not &ldquo;Obtained from&rdquo; TI is for TI's internal use only and shall not be construed as a representation of warranty regarding the proper open source license terms for such Software.
 </p>
 
 <h2><b>Export Information</b></h2>
 <p>
-ECCN for Software included in this release: 5D002 License Exception TSU
-</p>
-
-<p>
-ECCN for Technology (e.g., user documentation, specifications) included in this release: 5D002 License Exception TSU
+ECCN for Software included in this release: 5D991 (Telecom Software) 
 </p>
 
 <h2><b>Manifest</b></h2>
@@ -167,6 +164,62 @@ ECCN for Technology (e.g., user documentation, specifications) included in this
 See Legend above for a description of the columns and possible values.
 </p>
 " > ${SW_MANIFEST_FILE}
+
+cat > ${SW_MANIFEST_TEXT} << 'EOF'
+<--
+Manifest template 1.0  
+
+This template is used to generate an unloadable manifest to the SRAS. To do so, save the document as a plain text file (Save As .txt). Do not change any options on the save which means leave the default as Windows Default Encoding. The SRAS will generate a nice looking HTML manifest for you.
+
+Instructions:
+
+ 1.   Text in blue should not be edited or removed. It will NOT appear on your manifest.
+ 2.   DO NOT color outside the lines in the manifest.  There are specific blocks where you enter information. Information 
+       should only be entered in the sections below and not outside of them.
+ 3.   DO NOT use the < or > symbols in your manifest table or in your footnotes.
+ 4.   Please REFRAIN from using Word specific formatting when filling in the table. Examples are things like superscripts,
+      subscripts, etc. We are unable to understand those.
+ 5.   Auto correction is not your friend in word. Please turn it off. It should be disabled already in this template.
+
+Table Instructions:
+
+Define what you are delivering by filling in the table below. Tables start with the start keyword <table> end with the end keyword, </table> and may also contain footnotes specific to that table.  
+
+You can have as many .Public. tables as you like in your manifest and can name them.  You can have one and only one .Private. table. To create additional tables copy everything starting with <table> down to </table> and then paste it after the table below.
+
+The field .attribute =. can be set to Public (the default) or Private to define the type of table it is. If the table is Public then everything in the table will appear on your manifest. If the table is Private then none of the entries will appear on your manifest but they will be stored in the SRAS. Private tables are useful for documenting third party code, that requires Legal review, but does not need to be acknowledged on the manifest you ship; e.g. it may be covered by our TI license.
+
+The field .name = . is used to put a heading over the table on the manifest you ship.
+
+The field .description =. is used to put a description under the Table name on the manifest you ship.
+
+To learn how to document software in the table read the instructions here. A brief explanation of the table columns follows.
+License Type - If its an SPDX defined license use their short name identifier. You can see a list here: http://spdx.org/licenses/ . If it.s not on the list and not a commercial or TSPA  license then use the application name as the license.
+
+Delivered As - This field will either be .Source., .Binary. or .Source and Binary. and is the form the content of the Software is delivered in.  If the Software is delivered in an archive format, this field applies to the contents of the archive. If the word Limited is used with Source, as in .Limited Source. or .Limited Source and Binary. then only portions of the Source for the application are provided.
+
+Modified by TI - This field will either be .Yes. or .No.. A .Yes. means TI has made changes to the Software. A .No. means TI has not made any changes. Note: This field is not applicable for Software .Obtained from. TI.
+
+Location - The directory name and path on the media, e.g. drive, (or in an archive) where the Software is located after installing or extracting. 
+
+Obtained From - This field specifies from where or from whom TI obtained the Software. It may be a URL to an Open Source site, a 3rd party licensor, or TI (if TI developed the software). If this field contains a link to Open Source software, the date TI downloaded the Software is also recorded. See Links Disclaimer in the Disclaimers Section.
+-->
+
+<directives>
+Version = .1.0.
+Sep = .|.
+Tool=.Word.
+</directives>
+
+<-- ** Do not edit or remove anything above this line **   
+-->
+
+<--  
+Instructions: DO NOT Alter the column headings below. This is now a single row table as opposed to the older manifests which used merged rows. The order is extremely important; if you change the order or add or remove a column the upload will not work.
+-->
+
+EOF
+
 }
 
 sw_manifest_footer() {
@@ -212,27 +265,107 @@ echo "
 </html>
 
 " >> ${SW_MANIFEST_FILE}
+
+
+cat >> ${SW_MANIFEST_TEXT} << 'EOF'
+<Credits>
+
+</credits>
+
+<Licenses>
+
+Licenses can be found in the "docs/licenses" directory of the SDK install directory
+GCC RUNTIME LIBRARY EXCEPTION
+
+Version 3.1, 31 March 2009
+
+Copyright © 2009 Free Software Foundation, Inc. http://fsf.org/
+
+Everyone is permitted to copy and distribute verbatim copies of this license document, but changing it is not allowed.
+
+This GCC Runtime Library Exception (Exception) is an additional permission under section 7 of the GNU General Public License, version 3 (GPLv3). It applies to a given file (the Runtime Library) that bears a notice placed by the copyright holder of the file stating that the file is governed by GPLv3 along with this Exception.
+
+When you use GCC to compile a program, GCC may combine portions of certain GCC header files and runtime libraries with the compiled program. The purpose of this Exception is to allow compilation of non-GPL (including proprietary) programs to use, in this way, the header files and runtime libraries covered by this Exception.
+0. Definitions.
+
+A file is an Independent Module if it either requires the Runtime Library for execution after a Compilation Process, or makes use of an interface provided by the Runtime Library, but is not otherwise based on the Runtime Library.
+
+GCC means a version of the GNU Compiler Collection, with or without modifications, governed by version 3 (or a specified later version) of the GNU General Public License (GPL) with the option of using any subsequent versions published by the FSF.
+
+GPL-compatible Software is software whose conditions of propagation, modification and use would permit combination with GCC in accord with the license of GCC.
+
+GPL-compatible Software is software whose conditions of propagation, modification and use would permit combination with GCC in accord with the license of GCC.
+
+The Compilation Process transforms code entirely represented in non-intermediate languages designed for human-written code, and/or in Java Virtual Machine byte code, into Target Code. Thus, for example, use of source code generators and preprocessors need not be considered part of the Compilation Process, since the Compilation Process can be understood as starting with the output of the generators or preprocessors.
+
+A Compilation Process is Eligible if it is done using GCC, alone or with other GPL-compatible software, or if it is done without using any work based on GCC. For example, using non-GPL-compatible Software to optimize any GCC intermediate representations would not qualify as an Eligible Compilation Process.
+1. Grant of Additional Permission.
+
+You have permission to propagate a work of Target Code formed by combining the Runtime Library with Independent Modules, even if such propagation would otherwise violate the terms of GPLv3, provided that all Target Code was generated by Eligible Compilation Processes. You may then convey such a combination under terms of your choice, consistent with the licensing of the Independent Modules.
+2. No Weakening of GCC Copyleft.
+
+The availability of this Exception does not imply any general presumption that third-party software is unaffected by the copyleft requirements of the license of GCC.
+
+</licenses>
+EOF
+
+}
+
+sw_manifest_table_header() {
+    echo "
+<h2><u>$1</u></h2>
+<p>$2</p>
+" >> ${SW_MANIFEST_FILE}
+
+    cat >> ${SW_MANIFEST_TEXT} << EOF
+<table>
+<thead>
+attribute = "Public"
+name = "$1"
+description = "$2"
+</thead>
+
+EOF
 }
 
+sw_manifest_table_footer() {
+    if [ ! -z $1 ]; then
+        cat >> ${SW_MANIFEST_TEXT} << EOF
+<Footnotes>
+$1
+</footnotes>
+EOF
+    fi
+    cat >> ${SW_MANIFEST_TEXT} << EOF
+</table>
+
+EOF
+}
 # Create the host side toolchain components table
 sw_manifest_toolchain_host() {
     opkg_dir="${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}/sysroots/i686-*-linux/var/lib/opkg"
 
-echo "
-<h2><u>GPLv3 Development Host Content</u></h2>
-<p>This table describes any GPLv3 software being delivered that is expected to run on a Development Host, instead of the target device.</p>
-" >> ${SW_MANIFEST_FILE}
+    sw_manifest_table_header "GPLv3 Development Host Content" "This table describes any GPLv3 software being delivered that is expected to run on a Development Host, instead of the target device."
+
+#echo "
+#<h2><u>GPLv3 Development Host Content</u></h2>
+#<p>This table describes any GPLv3 software being delivered that is expected to run on a Development Host, instead of the target device.</p>
+#" >> ${SW_MANIFEST_FILE}
 
     generate_sw_manifest_table $opkg_dir "true"
 
+    sw_manifest_table_footer
 
-echo "
-<h2><u>Development Host Content</u></h2>
-<p>This table describes any software being delivered that is expected to run on a Development Host, instead of the target device.  Some of this software may be licensed under GPLv3 but it is not expected to be shipped as a product.</p>
-" >> ${SW_MANIFEST_FILE}
+    sw_manifest_table_header "Development Host Content" "This table describes any software being delivered that is expected to run on a Development Host, instead of the target device.  Some of this software may be licensed under GPLv3 but it is not expected to be shipped as a product."
+
+#echo "
+#<h2><u>Development Host Content</u></h2>
+#<p>This table describes any software being delivered that is expected to run on a Development Host, instead of the target device.  Some of this software may be licensed under GPLv3 but it is not expected to be shipped as a product.</p>
+#" >> ${SW_MANIFEST_FILE}
 
     generate_sw_manifest_table $opkg_dir
 
+    sw_manifest_table_footer
 }
 
 # Create the target side toolchain components table.  These are components on
@@ -240,33 +373,45 @@ echo "
 sw_manifest_toolchain_target() {
     opkg_dir="${IMAGE_ROOTFS}/${TISDK_TOOLCHAIN_PATH}/sysroots/*-oe-linux-gnueabi*/var/lib/opkg/info"
 
-echo "
-<h2><u>GPLv3 Development Libraries Installed on Host</u></h2>
-<p>This table describes GPLv3 software libraries and headers that are installed on the development host and used during the development of software to run on the target. Customers should be careful when linking against these libraries to make sure they are complying with the license(s) of the library</p>
-" >> ${SW_MANIFEST_FILE}
+    sw_manifest_table_header "GPLv3 Development Libraries Installed on Host" "This table describes GPLv3 software libraries and headers that are installed on the development host and used during the development of software to run on the target. Customers should be careful when linking against these libraries to make sure they are complying with the license(s) of the library"
+
+#echo "
+#<h2><u>GPLv3 Development Libraries Installed on Host</u></h2>
+#<p>This table describes GPLv3 software libraries and headers that are installed on the development host and used during the development of software to run on the target. Customers should be careful when linking against these libraries to make sure they are complying with the license(s) of the library</p>
+#" >> ${SW_MANIFEST_FILE}
 
     generate_sw_manifest_table $opkg_dir "true"
 
-echo "
-<h2><u>Development Libraries Installed on Host</u></h2>
-<p>This table describes software libraries and headers that are installed on the development host and used during the development of software to run on the target.  Some of this software may be licensed under GPLv3.  Customers should be careful when linking against these libraries to make sure they are complying with the license(s) of the library</p>
-" >> ${SW_MANIFEST_FILE}
+    sw_manifest_table_footer
+
+    sw_manifest_table_header "Development Libraries Installed on Host" "This table describes software libraries and headers that are installed on the development host and used during the development of software to run on the target.  Some of this software may be licensed under GPLv3.  Customers should be careful when linking against these libraries to make sure they are complying with the license(s) of the library"
+
+#echo "
+#<h2><u>Development Libraries Installed on Host</u></h2>
+#<p>This table describes software libraries and headers that are installed on the development host and used during the development of software to run on the target.  Some of this software may be licensed under GPLv3.  Customers should be careful when linking against these libraries to make sure they are complying with the license(s) of the library</p>
+#" >> ${SW_MANIFEST_FILE}
 
     generate_sw_manifest_table $opkg_dir
+
+    sw_manifest_table_footer
 }
 
 # Create the table of GPLv3 components found in the target file system
 sw_manifest_target_gplv3() {
     opkg_dir="$1"
 
-echo "
-<h2><u>GPLv3 Target Device Content</u></h2>
+    sw_manifest_table_header "GPLv3 Target Device Content" "This table describes any GPLv3 software being delivered that is expected to run on the target device."
 
-<p>This table describes any GPLv3 software being delivered that is expected to run on the target device.</p>
+#echo "
+#<h2><u>GPLv3 Target Device Content</u></h2>
 
-" >> ${SW_MANIFEST_FILE}
+#<p>This table describes any GPLv3 software being delivered that is expected to run on the target device.</p>
+#
+#" >> ${SW_MANIFEST_FILE}
 
     generate_sw_manifest_table $opkg_dir "true"
+
+    sw_manifest_table_footer
 }
 
 # Generate the full target file system components table.
@@ -291,31 +436,38 @@ sw_manifest_target() {
 
     sw_manifest_target_gplv3 $opkg_dir
 
-echo "
-<h2><u>All Target Device Content</u></h2>
+    sw_manifest_table_header "All Target Device Content" "This table describes any software being delivered that is expected to run on the target device."
 
-<p>This table describes any software being delivered that is expected to run on the target device.</p>
+#echo "
+#<h2><u>All Target Device Content</u></h2>
 
-" >> ${SW_MANIFEST_FILE}
+#<p>This table describes any software being delivered that is expected to run on the target device.</p>
+
+#" >> ${SW_MANIFEST_FILE}
 
     generate_sw_manifest_table $opkg_dir
 
+    sw_manifest_table_footer
     # Remove the temporary var directory that was extracted
     rm -rf ${IMAGE_ROOTFS}/filesystem/var
 }
 
 # Create the table of host components installed.
 sw_manifest_host() {
-echo "
-<h2><u>Additional Development Host Content</u></h2>
+    sw_manifest_table_header "Additional Development Host Content" "This table describes software that is installed on the development host but is not part of the linux-devkit package.  This is usually software example sources or tools such a flash utilities."
 
-<p>This table describes software that is installed on the development host but is not part of the linux-devkit package.  This is usually software example sources or tools such a flash utilities.</p>
+#echo "
+#<h2><u>Additional Development Host Content</u></h2>
 
-" >> ${SW_MANIFEST_FILE}
+#<p>This table describes software that is installed on the development host but is not part of the linux-devkit package.  This is usually software example sources or tools such a flash utilities.</p>
+
+#" >> ${SW_MANIFEST_FILE}
 
     opkg_dir="${IMAGE_ROOTFS}/var/lib/opkg/info"
 
     generate_sw_manifest_table $opkg_dir
+
+    sw_manifest_table_footer
 }
 
 # This function expects to be passed the following parameter
@@ -353,6 +505,18 @@ echo "
 </tr>
 " >> ${SW_MANIFEST_FILE}
 
+cat >> ${SW_MANIFEST_TEXT} << EOF
+<tbody>
+<!-- Software Name
+| Version
+| License Type
+| Delivered As
+| Modified by TI
+| Location
+| Obtained from -->
+
+EOF
+
     control_files_there=0
     for possible_control_file in $control_dir/*.control
     do
@@ -474,9 +638,18 @@ echo "
 </tr>
 " >> ${SW_MANIFEST_FILE}
 
+cat >> ${SW_MANIFEST_TEXT} << EOF
+| ${package} | ${version} | ${license/\|/\&} | ${delivered_as} | ${modified} | ${location} | ${source} 
+EOF
     done
 
     echo "</table><br><br>" >> ${SW_MANIFEST_FILE}
+
+cat >> ${SW_MANIFEST_TEXT} << EOF
+</tbody>
+
+EOF
+
 }
 
 # Generate the TI SW Manifest for the SDK image
-- 
1.7.9.5


