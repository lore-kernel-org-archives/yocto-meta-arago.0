Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id DF8B052A6F
	for <meta-arago@arago-project.org>;
	Thu, 27 Sep 2012 04:57:13 +0000 (UTC)
Received: by obblz20 with SMTP id lz20so1418541obb.38
	for <meta-arago@arago-project.org>;
	Wed, 26 Sep 2012 21:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=SnKpGgwKIPgv5xoikugoXiFEE/+QQLUkE4qMVmMGxIg=;
	b=QNYjtSv3ymvdM+ixlSVCLpPcd+9+m3+LTlZ/tY7xa2Uf0GqNRVIDsAIjdC1wJFtIWP
	svJCQSs2yf/n6akj/EXuT8kvn69EK+kOqUxRwVs0UuWNO5vehiN+ZzdneCa0e3S/4wVH
	GLwviFNEzJZzuzpqKbTmuBfM17PWGUkI6jEErkxXayFrUlB9aiqGTw1rCI/4fIG9b580
	mZ2agpxnbaBfEj7QStwyQRITPK2i+eQx1EckcTsx4h+39z47wcWOTDQq6AoeRMM3kaa5
	/AaXC4hpKMOwLY0Ob7xKDc1pvxp37MxiKX9jjR5LbcN0zmFzFJDVDNK8A3oq8lMy9SDx
	m76A==
Received: by 10.60.22.33 with SMTP id a1mr2215225oef.57.1348721832201;
	Wed, 26 Sep 2012 21:57:12 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id o4sm3806378oef.11.2012.09.26.21.57.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 26 Sep 2012 21:57:11 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu, 27 Sep 2012 00:22:31 -0500
Message-Id: <1348723352-9479-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [meta-arago-distro][PATCH 1/2] busybox-udhcpd-config: Add udhcpd config option
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
X-List-Received-Date: Thu, 27 Sep 2012 04:57:14 -0000

* Install udhcpd.conf file for setting up networking for Soft AP.
* Default udhcp.conf grabbed from busybox. Arago specific patches
  will be added later.
* This patch is based on a similar recipe from Arago called
  softap-udhcpd-config.
* License file pulled from busybox since this is where the original
  udhcpd.conf file was grabbed from.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../busybox/busybox-udhcpd-config/LICENSE          |  348 ++++++++++++++++++++
 .../busybox-udhcpd-config/omap3/udhcpd.conf        |  113 +++++++
 .../busybox-udhcpd-config/omapl138/udhcpd.conf     |  113 +++++++
 .../busybox-udhcpd-config/ti33x/udhcpd.conf        |  113 +++++++
 .../busybox/busybox-udhcpd-config/udhcpd.conf      |  113 +++++++
 .../busybox/busybox-udhcpd-config_1.0.bb           |   23 ++
 6 files changed, 823 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/busybox/busybox-udhcpd-config/LICENSE
 create mode 100644 meta-arago-distro/recipes-core/busybox/busybox-udhcpd-config/omap3/udhcpd.conf
 create mode 100644 meta-arago-distro/recipes-core/busybox/busybox-udhcpd-config/omapl138/udhcpd.conf
 create mode 100644 meta-arago-distro/recipes-core/busybox/busybox-udhcpd-config/ti33x/udhcpd.conf
 create mode 100644 meta-arago-distro/recipes-core/busybox/busybox-udhcpd-config/udhcpd.conf
 create mode 100644 meta-arago-distro/recipes-core/busybox/busybox-udhcpd-config_1.0.bb

diff --git a/meta-arago-distro/recipes-core/busybox/busybox-udhcpd-config/LICENSE b/meta-arago-distro/recipes-core/busybox/busybox-udhcpd-config/LICENSE
new file mode 100644
index 0000000..6f50a71
--- /dev/null
+++ b/meta-arago-distro/recipes-core/busybox/busybox-udhcpd-config/LICENSE
@@ -0,0 +1,348 @@
+--- A note on GPL versions
+
+BusyBox is distributed under version 2 of the General Public License (included
+in its entirety, below).  Version 2 is the only version of this license which
+this version of BusyBox (or modified versions derived from this one) may be
+distributed under.
+
+------------------------------------------------------------------------
+		    GNU GENERAL PUBLIC LICENSE
+		       Version 2, June 1991
+
+ Copyright (C) 1989, 1991 Free Software Foundation, Inc.
+     51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
+ Everyone is permitted to copy and distribute verbatim copies
+ of this license document, but changing it is not allowed.
+
+			    Preamble
+
+  The licenses for most software are designed to take away your
+freedom to share and change it.  By contrast, the GNU General Public
+License is intended to guarantee your freedom to share and change free
+software--to make sure the software is free for all its users.  This
+General Public License applies to most of the Free Software
+Foundation's software and to any other program whose authors commit to
+using it.  (Some other Free Software Foundation software is covered by
+the GNU Library General Public License instead.)  You can apply it to
+your programs, too.
+
+  When we speak of free software, we are referring to freedom, not
+price.  Our General Public Licenses are designed to make sure that you
+have the freedom to distribute copies of free software (and charge for
+this service if you wish), that you receive source code or can get it
+if you want it, that you can change the software or use pieces of it
+in new free programs; and that you know you can do these things.
+
+  To protect your rights, we need to make restrictions that forbid
+anyone to deny you these rights or to ask you to surrender the rights.
+These restrictions translate to certain responsibilities for you if you
+distribute copies of the software, or if you modify it.
+
+  For example, if you distribute copies of such a program, whether
+gratis or for a fee, you must give the recipients all the rights that
+you have.  You must make sure that they, too, receive or can get the
+source code.  And you must show them these terms so they know their
+rights.
+
+  We protect your rights with two steps: (1) copyright the software, and
+(2) offer you this license which gives you legal permission to copy,
+distribute and/or modify the software.
+
+  Also, for each author's protection and ours, we want to make certain
+that everyone understands that there is no warranty for this free
+software.  If the software is modified by someone else and passed on, we
+want its recipients to know that what they have is not the original, so
+that any problems introduced by others will not reflect on the original
+authors' reputations.
+
+  Finally, any free program is threatened constantly by software
+patents.  We wish to avoid the danger that redistributors of a free
+program will individually obtain patent licenses, in effect making the
+program proprietary.  To prevent this, we have made it clear that any
+patent must be licensed for everyone's free use or not licensed at all.
+
+  The precise terms and conditions for copying, distribution and
+modification follow.
+
+		    GNU GENERAL PUBLIC LICENSE
+   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
+
+  0. This License applies to any program or other work which contains
+a notice placed by the copyright holder saying it may be distributed
+under the terms of this General Public License.  The "Program", below,
+refers to any such program or work, and a "work based on the Program"
+means either the Program or any derivative work under copyright law:
+that is to say, a work containing the Program or a portion of it,
+either verbatim or with modifications and/or translated into another
+language.  (Hereinafter, translation is included without limitation in
+the term "modification".)  Each licensee is addressed as "you".
+
+Activities other than copying, distribution and modification are not
+covered by this License; they are outside its scope.  The act of
+running the Program is not restricted, and the output from the Program
+is covered only if its contents constitute a work based on the
+Program (independent of having been made by running the Program).
+Whether that is true depends on what the Program does.
+
+  1. You may copy and distribute verbatim copies of the Program's
+source code as you receive it, in any medium, provided that you
+conspicuously and appropriately publish on each copy an appropriate
+copyright notice and disclaimer of warranty; keep intact all the
+notices that refer to this License and to the absence of any warranty;
+and give any other recipients of the Program a copy of this License
+along with the Program.
+
+You may charge a fee for the physical act of transferring a copy, and
+you may at your option offer warranty protection in exchange for a fee.
+
+  2. You may modify your copy or copies of the Program or any portion
+of it, thus forming a work based on the Program, and copy and
+distribute such modifications or work under the terms of Section 1
+above, provided that you also meet all of these conditions:
+
+    a) You must cause the modified files to carry prominent notices
+    stating that you changed the files and the date of any change.
+
+    b) You must cause any work that you distribute or publish, that in
+    whole or in part contains or is derived from the Program or any
+    part thereof, to be licensed as a whole at no charge to all third
+    parties under the terms of this License.
+
+    c) If the modified program normally reads commands interactively
+    when run, you must cause it, when started running for such
+    interactive use in the most ordinary way, to print or display an
+    announcement including an appropriate copyright notice and a
+    notice that there is no warranty (or else, saying that you provide
+    a warranty) and that users may redistribute the program under
+    these conditions, and telling the user how to view a copy of this
+    License.  (Exception: if the Program itself is interactive but
+    does not normally print such an announcement, your work based on
+    the Program is not required to print an announcement.)
+
+These requirements apply to the modified work as a whole.  If
+identifiable sections of that work are not derived from the Program,
+and can be reasonably considered independent and separate works in
+themselves, then this License, and its terms, do not apply to those
+sections when you distribute them as separate works.  But when you
+distribute the same sections as part of a whole which is a work based
+on the Program, the distribution of the whole must be on the terms of
+this License, whose permissions for other licensees extend to the
+entire whole, and thus to each and every part regardless of who wrote it.
+
+Thus, it is not the intent of this section to claim rights or contest
+your rights to work written entirely by you; rather, the intent is to
+exercise the right to control the distribution of derivative or
+collective works based on the Program.
+
+In addition, mere aggregation of another work not based on the Program
+with the Program (or with a work based on the Program) on a volume of
+a storage or distribution medium does not bring the other work under
+the scope of this License.
+
+  3. You may copy and distribute the Program (or a work based on it,
+under Section 2) in object code or executable form under the terms of
+Sections 1 and 2 above provided that you also do one of the following:
+
+    a) Accompany it with the complete corresponding machine-readable
+    source code, which must be distributed under the terms of Sections
+    1 and 2 above on a medium customarily used for software interchange; or,
+
+    b) Accompany it with a written offer, valid for at least three
+    years, to give any third party, for a charge no more than your
+    cost of physically performing source distribution, a complete
+    machine-readable copy of the corresponding source code, to be
+    distributed under the terms of Sections 1 and 2 above on a medium
+    customarily used for software interchange; or,
+
+    c) Accompany it with the information you received as to the offer
+    to distribute corresponding source code.  (This alternative is
+    allowed only for noncommercial distribution and only if you
+    received the program in object code or executable form with such
+    an offer, in accord with Subsection b above.)
+
+The source code for a work means the preferred form of the work for
+making modifications to it.  For an executable work, complete source
+code means all the source code for all modules it contains, plus any
+associated interface definition files, plus the scripts used to
+control compilation and installation of the executable.  However, as a
+special exception, the source code distributed need not include
+anything that is normally distributed (in either source or binary
+form) with the major components (compiler, kernel, and so on) of the
+operating system on which the executable runs, unless that component
+itself accompanies the executable.
+
+If distribution of executable or object code is made by offering
+access to copy from a designated place, then offering equivalent
+access to copy the source code from the same place counts as
+distribution of the source code, even though third parties are not
+compelled to copy the source along with the object code.
+
+  4. You may not copy, modify, sublicense, or distribute the Program
+except as expressly provided under this License.  Any attempt
+otherwise to copy, modify, sublicense or distribute the Program is
+void, and will automatically terminate your rights under this License.
+However, parties who have received copies, or rights, from you under
+this License will not have their licenses terminated so long as such
+parties remain in full compliance.
+
+  5. You are not required to accept this License, since you have not
+signed it.  However, nothing else grants you permission to modify or
+distribute the Program or its derivative works.  These actions are
+prohibited by law if you do not accept this License.  Therefore, by
+modifying or distributing the Program (or any work based on the
+Program), you indicate your acceptance of this License to do so, and
+all its terms and conditions for copying, distributing or modifying
+the Program or works based on it.
+
+  6. Each time you redistribute the Program (or any work based on the
+Program), the recipient automatically receives a license from the
+original licensor to copy, distribute or modify the Program subject to
+these terms and conditions.  You may not impose any further
+restrictions on the recipients' exercise of the rights granted herein.
+You are not responsible for enforcing compliance by third parties to
+this License.
+
+  7. If, as a consequence of a court judgment or allegation of patent
+infringement or for any other reason (not limited to patent issues),
+conditions are imposed on you (whether by court order, agreement or
+otherwise) that contradict the conditions of this License, they do not
+excuse you from the conditions of this License.  If you cannot
+distribute so as to satisfy simultaneously your obligations under this
+License and any other pertinent obligations, then as a consequence you
+may not distribute the Program at all.  For example, if a patent
+license would not permit royalty-free redistribution of the Program by
+all those who receive copies directly or indirectly through you, then
+the only way you could satisfy both it and this License would be to
+refrain entirely from distribution of the Program.
+
+If any portion of this section is held invalid or unenforceable under
+any particular circumstance, the balance of the section is intended to
+apply and the section as a whole is intended to apply in other
+circumstances.
+
+It is not the purpose of this section to induce you to infringe any
+patents or other property right claims or to contest validity of any
+such claims; this section has the sole purpose of protecting the
+integrity of the free software distribution system, which is
+implemented by public license practices.  Many people have made
+generous contributions to the wide range of software distributed
+through that system in reliance on consistent application of that
+system; it is up to the author/donor to decide if he or she is willing
+to distribute software through any other system and a licensee cannot
+impose that choice.
+
+This section is intended to make thoroughly clear what is believed to
+be a consequence of the rest of this License.
+
+  8. If the distribution and/or use of the Program is restricted in
+certain countries either by patents or by copyrighted interfaces, the
+original copyright holder who places the Program under this License
+may add an explicit geographical distribution limitation excluding
+those countries, so that distribution is permitted only in or among
+countries not thus excluded.  In such case, this License incorporates
+the limitation as if written in the body of this License.
+
+  9. The Free Software Foundation may publish revised and/or new versions
+of the General Public License from time to time.  Such new versions will
+be similar in spirit to the present version, but may differ in detail to
+address new problems or concerns.
+
+Each version is given a distinguishing version number.  If the Program
+specifies a version number of this License which applies to it and "any
+later version", you have the option of following the terms and conditions
+either of that version or of any later version published by the Free
+Software Foundation.  If the Program does not specify a version number of
+this License, you may choose any version ever published by the Free Software
+Foundation.
+
+  10. If you wish to incorporate parts of the Program into other free
+programs whose distribution conditions are different, write to the author
+to ask for permission.  For software which is copyrighted by the Free
+Software Foundation, write to the Free Software Foundation; we sometimes
+make exceptions for this.  Our decision will be guided by the two goals
+of preserving the free status of all derivatives of our free software and
+of promoting the sharing and reuse of software generally.
+
+			    NO WARRANTY
+
+  11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
+FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT WHEN
+OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
+PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED
+OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
+MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.  THE ENTIRE RISK AS
+TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU.  SHOULD THE
+PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING,
+REPAIR OR CORRECTION.
+
+  12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
+WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
+REDISTRIBUTE THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES,
+INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING
+OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED
+TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY
+YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER
+PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE
+POSSIBILITY OF SUCH DAMAGES.
+
+		     END OF TERMS AND CONDITIONS
+
+	    How to Apply These Terms to Your New Programs
+
+  If you develop a new program, and you want it to be of the greatest
+possible use to the public, the best way to achieve this is to make it
+free software which everyone can redistribute and change under these terms.
+
+  To do so, attach the following notices to the program.  It is safest
+to attach them to the start of each source file to most effectively
+convey the exclusion of warranty; and each file should have at least
+the "copyright" line and a pointer to where the full notice is found.
+
+    <one line to give the program's name and a brief idea of what it does.>
+    Copyright (C) <year>  <name of author>
+
+    This program is free software; you can redistribute it and/or modify
+    it under the terms of the GNU General Public License as published by
+    the Free Software Foundation; either version 2 of the License, or
+    (at your option) any later version.
+
+    This program is distributed in the hope that it will be useful,
+    but WITHOUT ANY WARRANTY; without even the implied warranty of
+    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+    GNU General Public License for more details.
+
+    You should have received a copy of the GNU General Public License
+    along with this program; if not, write to the Free Software
+    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
+
+
+Also add information on how to contact you by electronic and paper mail.
+
+If the program is interactive, make it output a short notice like this
+when it starts in an interactive mode:
+
+    Gnomovision version 69, Copyright (C) year  name of author
+    Gnomovision comes with ABSOLUTELY NO WARRANTY; for details type `show w'.
+    This is free software, and you are welcome to redistribute it
+    under certain conditions; type `show c' for details.
+
+The hypothetical commands `show w' and `show c' should show the appropriate
+parts of the General Public License.  Of course, the commands you use may
+be called something other than `show w' and `show c'; they could even be
+mouse-clicks or menu items--whatever suits your program.
+
+You should also get your employer (if you work as a programmer) or your
+school, if any, to sign a "copyright disclaimer" for the program, if
+necessary.  Here is a sample; alter the names:
+
+  Yoyodyne, Inc., hereby disclaims all copyright interest in the program
+  `Gnomovision' (which makes passes at compilers) written by James Hacker.
+
+  <signature of Ty Coon>, 1 April 1989
+  Ty Coon, President of Vice
+
+This General Public License does not permit incorporating your program into
+proprietary programs.  If your program is a subroutine library, you may
+consider it more useful to permit linking proprietary applications with the
+library.  If this is what you want to do, use the GNU Library General
+Public License instead of this License.
diff --git a/meta-arago-distro/recipes-core/busybox/busybox-udhcpd-config/omap3/udhcpd.conf b/meta-arago-distro/recipes-core/busybox/busybox-udhcpd-config/omap3/udhcpd.conf
new file mode 100644
index 0000000..cd2957c
--- /dev/null
+++ b/meta-arago-distro/recipes-core/busybox/busybox-udhcpd-config/omap3/udhcpd.conf
@@ -0,0 +1,113 @@
+# Sample udhcpd configuration file (/etc/udhcpd.conf)
+# Values shown are defaults
+
+# The start and end of the IP lease block
+start		192.168.0.20
+end		192.168.0.254
+
+# The interface that udhcpd will use
+interface	eth0
+
+# The maximum number of leases (includes addresses reserved
+# by OFFER's, DECLINE's, and ARP conflicts). Will be corrected
+# if it's bigger than IP lease block, but it ok to make it
+# smaller than lease block.
+#max_leases	254
+
+# The amount of time that an IP will be reserved (leased to nobody)
+# if a DHCP decline message is received (seconds)
+#decline_time	3600
+
+# The amount of time that an IP will be reserved
+# if an ARP conflict occurs (seconds)
+#conflict_time	3600
+
+# How long an offered address is reserved (seconds)
+#offer_time	60
+
+# If client asks for lease below this value, it will be rounded up
+# to this value (seconds)
+#min_lease	60
+
+# The location of the pid file
+#pidfile	/var/run/udhcpd.pid
+
+# The location of the leases file
+#lease_file	/var/lib/misc/udhcpd.leases
+
+# The time period at which udhcpd will write out leases file.
+# If this is 0, udhcpd will never automatically write leases file.
+# Specified in seconds.
+#auto_time	7200
+
+# Every time udhcpd writes a leases file, the below script will be called
+#notify_file			# default: no script
+#notify_file	dumpleases	# useful for debugging
+
+# The following are bootp specific options
+# next server to use in bootstrap
+#siaddr		192.168.0.22	# default: 0.0.0.0 (none)
+# tftp server name
+#sname		zorak		# default: none
+# tftp file to download (e.g. kernel image)
+#boot_file	/var/nfs_root	# default: none
+
+# Static leases map
+#static_lease 00:60:08:11:CE:4E 192.168.0.54
+#static_lease 00:60:08:11:CE:3E 192.168.0.44
+
+# The remainder of options are DHCP options and can be specified with the
+# keyword 'opt' or 'option'. If an option can take multiple items, such
+# as the dns option, they can be listed on the same line, or multiple
+# lines.
+# Examples:
+opt	dns	192.168.10.2 192.168.10.10
+option	subnet	255.255.255.0
+opt	router	192.168.10.2
+opt	wins	192.168.10.10
+option	dns	129.219.13.81	# appended to above DNS servers for a total of 3
+option	domain	local
+option	lease	864000		# default: 10 days
+# Arbitrary option in hex form:
+option	0x08	01020304	# option 8: "cookie server IP addr: 1.2.3.4"
+
+# Currently supported options (for more info, see options.c):
+#opt lease      NUM
+#opt subnet     IP
+#opt broadcast  IP
+#opt router     IP_LIST
+#opt ipttl      NUM
+#opt mtu        NUM
+#opt hostname   STRING		# client's hostname
+#opt domain     STRING		# client's domain suffix
+#opt search     STRING_LIST	# search domains
+#opt nisdomain  STRING
+#opt timezone   NUM		# (localtime - UTC_time) in seconds. signed
+#opt tftp       STRING		# tftp server name
+#opt bootfile   STRING		# tftp file to download (e.g. kernel image)
+#opt bootsize   NUM		# size of that file
+#opt rootpath   STRING		# (NFS) path to mount as root fs
+#opt wpad       STRING
+#opt serverid   IP		# default: server's IP
+#opt message    STRING		# error message (udhcpd sends it on success too)
+#opt vlanid     NUM		# 802.1P VLAN ID
+#opt vlanpriority NUM		# 802.1Q VLAN priority
+# Options specifying server(s)
+#opt dns        IP_LIST
+#opt wins       IP_LIST
+#opt nissrv     IP_LIST
+#opt ntpsrv     IP_LIST
+#opt lprsrv     IP_LIST
+#opt swapsrv    IP
+# Options specifying routes
+#opt routes     IP_PAIR_LIST
+# Obsolete options, no longer supported
+#opt logsrv     IP_LIST	# 704/UDP log server (not syslog!)
+#opt namesrv    IP_LIST	# IEN 116 name server, obsolete (August 1979!!!)
+#opt cookiesrv  IP_LIST	# RFC 865 "quote of the day" server, rarely (never?) used
+#opt timesrv    IP_LIST	# RFC 868 time server, rarely (never?) used
+# TODO: in development
+#opt userclass  STRING		# RFC 3004. set of LASCII strings. "I am a printer" etc
+#opt sipserv    STRING LIST	# RFC 3361. flag byte, then: 0: domain names, 1: IP addrs
+#opt staticroutes   STATIC_ROUTES
+#opt msstaticroutes STATIC_ROUTES
diff --git a/meta-arago-distro/recipes-core/busybox/busybox-udhcpd-config/omapl138/udhcpd.conf b/meta-arago-distro/recipes-core/busybox/busybox-udhcpd-config/omapl138/udhcpd.conf
new file mode 100644
index 0000000..cd2957c
--- /dev/null
+++ b/meta-arago-distro/recipes-core/busybox/busybox-udhcpd-config/omapl138/udhcpd.conf
@@ -0,0 +1,113 @@
+# Sample udhcpd configuration file (/etc/udhcpd.conf)
+# Values shown are defaults
+
+# The start and end of the IP lease block
+start		192.168.0.20
+end		192.168.0.254
+
+# The interface that udhcpd will use
+interface	eth0
+
+# The maximum number of leases (includes addresses reserved
+# by OFFER's, DECLINE's, and ARP conflicts). Will be corrected
+# if it's bigger than IP lease block, but it ok to make it
+# smaller than lease block.
+#max_leases	254
+
+# The amount of time that an IP will be reserved (leased to nobody)
+# if a DHCP decline message is received (seconds)
+#decline_time	3600
+
+# The amount of time that an IP will be reserved
+# if an ARP conflict occurs (seconds)
+#conflict_time	3600
+
+# How long an offered address is reserved (seconds)
+#offer_time	60
+
+# If client asks for lease below this value, it will be rounded up
+# to this value (seconds)
+#min_lease	60
+
+# The location of the pid file
+#pidfile	/var/run/udhcpd.pid
+
+# The location of the leases file
+#lease_file	/var/lib/misc/udhcpd.leases
+
+# The time period at which udhcpd will write out leases file.
+# If this is 0, udhcpd will never automatically write leases file.
+# Specified in seconds.
+#auto_time	7200
+
+# Every time udhcpd writes a leases file, the below script will be called
+#notify_file			# default: no script
+#notify_file	dumpleases	# useful for debugging
+
+# The following are bootp specific options
+# next server to use in bootstrap
+#siaddr		192.168.0.22	# default: 0.0.0.0 (none)
+# tftp server name
+#sname		zorak		# default: none
+# tftp file to download (e.g. kernel image)
+#boot_file	/var/nfs_root	# default: none
+
+# Static leases map
+#static_lease 00:60:08:11:CE:4E 192.168.0.54
+#static_lease 00:60:08:11:CE:3E 192.168.0.44
+
+# The remainder of options are DHCP options and can be specified with the
+# keyword 'opt' or 'option'. If an option can take multiple items, such
+# as the dns option, they can be listed on the same line, or multiple
+# lines.
+# Examples:
+opt	dns	192.168.10.2 192.168.10.10
+option	subnet	255.255.255.0
+opt	router	192.168.10.2
+opt	wins	192.168.10.10
+option	dns	129.219.13.81	# appended to above DNS servers for a total of 3
+option	domain	local
+option	lease	864000		# default: 10 days
+# Arbitrary option in hex form:
+option	0x08	01020304	# option 8: "cookie server IP addr: 1.2.3.4"
+
+# Currently supported options (for more info, see options.c):
+#opt lease      NUM
+#opt subnet     IP
+#opt broadcast  IP
+#opt router     IP_LIST
+#opt ipttl      NUM
+#opt mtu        NUM
+#opt hostname   STRING		# client's hostname
+#opt domain     STRING		# client's domain suffix
+#opt search     STRING_LIST	# search domains
+#opt nisdomain  STRING
+#opt timezone   NUM		# (localtime - UTC_time) in seconds. signed
+#opt tftp       STRING		# tftp server name
+#opt bootfile   STRING		# tftp file to download (e.g. kernel image)
+#opt bootsize   NUM		# size of that file
+#opt rootpath   STRING		# (NFS) path to mount as root fs
+#opt wpad       STRING
+#opt serverid   IP		# default: server's IP
+#opt message    STRING		# error message (udhcpd sends it on success too)
+#opt vlanid     NUM		# 802.1P VLAN ID
+#opt vlanpriority NUM		# 802.1Q VLAN priority
+# Options specifying server(s)
+#opt dns        IP_LIST
+#opt wins       IP_LIST
+#opt nissrv     IP_LIST
+#opt ntpsrv     IP_LIST
+#opt lprsrv     IP_LIST
+#opt swapsrv    IP
+# Options specifying routes
+#opt routes     IP_PAIR_LIST
+# Obsolete options, no longer supported
+#opt logsrv     IP_LIST	# 704/UDP log server (not syslog!)
+#opt namesrv    IP_LIST	# IEN 116 name server, obsolete (August 1979!!!)
+#opt cookiesrv  IP_LIST	# RFC 865 "quote of the day" server, rarely (never?) used
+#opt timesrv    IP_LIST	# RFC 868 time server, rarely (never?) used
+# TODO: in development
+#opt userclass  STRING		# RFC 3004. set of LASCII strings. "I am a printer" etc
+#opt sipserv    STRING LIST	# RFC 3361. flag byte, then: 0: domain names, 1: IP addrs
+#opt staticroutes   STATIC_ROUTES
+#opt msstaticroutes STATIC_ROUTES
diff --git a/meta-arago-distro/recipes-core/busybox/busybox-udhcpd-config/ti33x/udhcpd.conf b/meta-arago-distro/recipes-core/busybox/busybox-udhcpd-config/ti33x/udhcpd.conf
new file mode 100644
index 0000000..cd2957c
--- /dev/null
+++ b/meta-arago-distro/recipes-core/busybox/busybox-udhcpd-config/ti33x/udhcpd.conf
@@ -0,0 +1,113 @@
+# Sample udhcpd configuration file (/etc/udhcpd.conf)
+# Values shown are defaults
+
+# The start and end of the IP lease block
+start		192.168.0.20
+end		192.168.0.254
+
+# The interface that udhcpd will use
+interface	eth0
+
+# The maximum number of leases (includes addresses reserved
+# by OFFER's, DECLINE's, and ARP conflicts). Will be corrected
+# if it's bigger than IP lease block, but it ok to make it
+# smaller than lease block.
+#max_leases	254
+
+# The amount of time that an IP will be reserved (leased to nobody)
+# if a DHCP decline message is received (seconds)
+#decline_time	3600
+
+# The amount of time that an IP will be reserved
+# if an ARP conflict occurs (seconds)
+#conflict_time	3600
+
+# How long an offered address is reserved (seconds)
+#offer_time	60
+
+# If client asks for lease below this value, it will be rounded up
+# to this value (seconds)
+#min_lease	60
+
+# The location of the pid file
+#pidfile	/var/run/udhcpd.pid
+
+# The location of the leases file
+#lease_file	/var/lib/misc/udhcpd.leases
+
+# The time period at which udhcpd will write out leases file.
+# If this is 0, udhcpd will never automatically write leases file.
+# Specified in seconds.
+#auto_time	7200
+
+# Every time udhcpd writes a leases file, the below script will be called
+#notify_file			# default: no script
+#notify_file	dumpleases	# useful for debugging
+
+# The following are bootp specific options
+# next server to use in bootstrap
+#siaddr		192.168.0.22	# default: 0.0.0.0 (none)
+# tftp server name
+#sname		zorak		# default: none
+# tftp file to download (e.g. kernel image)
+#boot_file	/var/nfs_root	# default: none
+
+# Static leases map
+#static_lease 00:60:08:11:CE:4E 192.168.0.54
+#static_lease 00:60:08:11:CE:3E 192.168.0.44
+
+# The remainder of options are DHCP options and can be specified with the
+# keyword 'opt' or 'option'. If an option can take multiple items, such
+# as the dns option, they can be listed on the same line, or multiple
+# lines.
+# Examples:
+opt	dns	192.168.10.2 192.168.10.10
+option	subnet	255.255.255.0
+opt	router	192.168.10.2
+opt	wins	192.168.10.10
+option	dns	129.219.13.81	# appended to above DNS servers for a total of 3
+option	domain	local
+option	lease	864000		# default: 10 days
+# Arbitrary option in hex form:
+option	0x08	01020304	# option 8: "cookie server IP addr: 1.2.3.4"
+
+# Currently supported options (for more info, see options.c):
+#opt lease      NUM
+#opt subnet     IP
+#opt broadcast  IP
+#opt router     IP_LIST
+#opt ipttl      NUM
+#opt mtu        NUM
+#opt hostname   STRING		# client's hostname
+#opt domain     STRING		# client's domain suffix
+#opt search     STRING_LIST	# search domains
+#opt nisdomain  STRING
+#opt timezone   NUM		# (localtime - UTC_time) in seconds. signed
+#opt tftp       STRING		# tftp server name
+#opt bootfile   STRING		# tftp file to download (e.g. kernel image)
+#opt bootsize   NUM		# size of that file
+#opt rootpath   STRING		# (NFS) path to mount as root fs
+#opt wpad       STRING
+#opt serverid   IP		# default: server's IP
+#opt message    STRING		# error message (udhcpd sends it on success too)
+#opt vlanid     NUM		# 802.1P VLAN ID
+#opt vlanpriority NUM		# 802.1Q VLAN priority
+# Options specifying server(s)
+#opt dns        IP_LIST
+#opt wins       IP_LIST
+#opt nissrv     IP_LIST
+#opt ntpsrv     IP_LIST
+#opt lprsrv     IP_LIST
+#opt swapsrv    IP
+# Options specifying routes
+#opt routes     IP_PAIR_LIST
+# Obsolete options, no longer supported
+#opt logsrv     IP_LIST	# 704/UDP log server (not syslog!)
+#opt namesrv    IP_LIST	# IEN 116 name server, obsolete (August 1979!!!)
+#opt cookiesrv  IP_LIST	# RFC 865 "quote of the day" server, rarely (never?) used
+#opt timesrv    IP_LIST	# RFC 868 time server, rarely (never?) used
+# TODO: in development
+#opt userclass  STRING		# RFC 3004. set of LASCII strings. "I am a printer" etc
+#opt sipserv    STRING LIST	# RFC 3361. flag byte, then: 0: domain names, 1: IP addrs
+#opt staticroutes   STATIC_ROUTES
+#opt msstaticroutes STATIC_ROUTES
diff --git a/meta-arago-distro/recipes-core/busybox/busybox-udhcpd-config/udhcpd.conf b/meta-arago-distro/recipes-core/busybox/busybox-udhcpd-config/udhcpd.conf
new file mode 100644
index 0000000..cd2957c
--- /dev/null
+++ b/meta-arago-distro/recipes-core/busybox/busybox-udhcpd-config/udhcpd.conf
@@ -0,0 +1,113 @@
+# Sample udhcpd configuration file (/etc/udhcpd.conf)
+# Values shown are defaults
+
+# The start and end of the IP lease block
+start		192.168.0.20
+end		192.168.0.254
+
+# The interface that udhcpd will use
+interface	eth0
+
+# The maximum number of leases (includes addresses reserved
+# by OFFER's, DECLINE's, and ARP conflicts). Will be corrected
+# if it's bigger than IP lease block, but it ok to make it
+# smaller than lease block.
+#max_leases	254
+
+# The amount of time that an IP will be reserved (leased to nobody)
+# if a DHCP decline message is received (seconds)
+#decline_time	3600
+
+# The amount of time that an IP will be reserved
+# if an ARP conflict occurs (seconds)
+#conflict_time	3600
+
+# How long an offered address is reserved (seconds)
+#offer_time	60
+
+# If client asks for lease below this value, it will be rounded up
+# to this value (seconds)
+#min_lease	60
+
+# The location of the pid file
+#pidfile	/var/run/udhcpd.pid
+
+# The location of the leases file
+#lease_file	/var/lib/misc/udhcpd.leases
+
+# The time period at which udhcpd will write out leases file.
+# If this is 0, udhcpd will never automatically write leases file.
+# Specified in seconds.
+#auto_time	7200
+
+# Every time udhcpd writes a leases file, the below script will be called
+#notify_file			# default: no script
+#notify_file	dumpleases	# useful for debugging
+
+# The following are bootp specific options
+# next server to use in bootstrap
+#siaddr		192.168.0.22	# default: 0.0.0.0 (none)
+# tftp server name
+#sname		zorak		# default: none
+# tftp file to download (e.g. kernel image)
+#boot_file	/var/nfs_root	# default: none
+
+# Static leases map
+#static_lease 00:60:08:11:CE:4E 192.168.0.54
+#static_lease 00:60:08:11:CE:3E 192.168.0.44
+
+# The remainder of options are DHCP options and can be specified with the
+# keyword 'opt' or 'option'. If an option can take multiple items, such
+# as the dns option, they can be listed on the same line, or multiple
+# lines.
+# Examples:
+opt	dns	192.168.10.2 192.168.10.10
+option	subnet	255.255.255.0
+opt	router	192.168.10.2
+opt	wins	192.168.10.10
+option	dns	129.219.13.81	# appended to above DNS servers for a total of 3
+option	domain	local
+option	lease	864000		# default: 10 days
+# Arbitrary option in hex form:
+option	0x08	01020304	# option 8: "cookie server IP addr: 1.2.3.4"
+
+# Currently supported options (for more info, see options.c):
+#opt lease      NUM
+#opt subnet     IP
+#opt broadcast  IP
+#opt router     IP_LIST
+#opt ipttl      NUM
+#opt mtu        NUM
+#opt hostname   STRING		# client's hostname
+#opt domain     STRING		# client's domain suffix
+#opt search     STRING_LIST	# search domains
+#opt nisdomain  STRING
+#opt timezone   NUM		# (localtime - UTC_time) in seconds. signed
+#opt tftp       STRING		# tftp server name
+#opt bootfile   STRING		# tftp file to download (e.g. kernel image)
+#opt bootsize   NUM		# size of that file
+#opt rootpath   STRING		# (NFS) path to mount as root fs
+#opt wpad       STRING
+#opt serverid   IP		# default: server's IP
+#opt message    STRING		# error message (udhcpd sends it on success too)
+#opt vlanid     NUM		# 802.1P VLAN ID
+#opt vlanpriority NUM		# 802.1Q VLAN priority
+# Options specifying server(s)
+#opt dns        IP_LIST
+#opt wins       IP_LIST
+#opt nissrv     IP_LIST
+#opt ntpsrv     IP_LIST
+#opt lprsrv     IP_LIST
+#opt swapsrv    IP
+# Options specifying routes
+#opt routes     IP_PAIR_LIST
+# Obsolete options, no longer supported
+#opt logsrv     IP_LIST	# 704/UDP log server (not syslog!)
+#opt namesrv    IP_LIST	# IEN 116 name server, obsolete (August 1979!!!)
+#opt cookiesrv  IP_LIST	# RFC 865 "quote of the day" server, rarely (never?) used
+#opt timesrv    IP_LIST	# RFC 868 time server, rarely (never?) used
+# TODO: in development
+#opt userclass  STRING		# RFC 3004. set of LASCII strings. "I am a printer" etc
+#opt sipserv    STRING LIST	# RFC 3361. flag byte, then: 0: domain names, 1: IP addrs
+#opt staticroutes   STATIC_ROUTES
+#opt msstaticroutes STATIC_ROUTES
diff --git a/meta-arago-distro/recipes-core/busybox/busybox-udhcpd-config_1.0.bb b/meta-arago-distro/recipes-core/busybox/busybox-udhcpd-config_1.0.bb
new file mode 100644
index 0000000..b0dc96b
--- /dev/null
+++ b/meta-arago-distro/recipes-core/busybox/busybox-udhcpd-config_1.0.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "Configuration files for SoftAP with udhcpd"
+SECTION = "console/network"
+HOMEPAGE = "http://udhcp.busybox.net/"
+LICENSE = "GPLv2 & BSD-4-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=de10de48642ab74318e893a61105afbb"
+
+PR = "r0"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+S = "${WORKDIR}"
+
+# Default configuration file is from the base udhcp package
+SRC_URI = "file://udhcpd.conf \
+           file://LICENSE"
+
+do_install() {
+    install -d ${D}${sysconfdir}
+    install -m 0755 ${S}/udhcpd.conf ${D}${sysconfdir}
+}
+
+FILES_${PN} += "${sysconfdir}/udhcpd.conf"
+CONFFILES_${PN} += "${sysconfdir}/udhcpd.conf"
-- 
1.7.0.4


