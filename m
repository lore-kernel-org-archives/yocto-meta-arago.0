Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTP id 9280252972
	for <meta-arago@arago-project.org>;
	Wed,  8 Jan 2014 05:13:16 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [96.231.138.104])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MZ200IUNH55AQW0@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 07 Jan 2014 23:12:57 -0600 (CST)
Received: from android-613965610fc6ed9f.denix (unknown [192.168.0.122])
	by gandalf.denix.org (Postfix) with ESMTPA id D506E2008E; Wed,
	08 Jan 2014 00:12:40 -0500 (EST)
User-Agent: K-9 Mail for Android
In-reply-to: <464859D4BE03A84686BA47749242C1D03EFEFCFE@DBDE04.ent.ti.com>
References: <CF956B779D819D41BBC043B7082161D5478BBE@DBDE04.ent.ti.com>
	<464859D4BE03A84686BA47749242C1D03EFEFCFE@DBDE04.ent.ti.com>
MIME-version: 1.0
From: Denys Dmytriyenko <denis@denix.org>
Date: Wed, 08 Jan 2014 00:12:30 -0500
To: "Srinivasan, Nageswari" <nageswari@ti.com>,
	"Hingolikar, Mrinmayee" <mrinmayee@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Message-id: <b8e21671-f167-430e-b985-23d234edc525@email.android.com>
Cc: "R, Karthik" <karthik.ramanan@ti.com>
Subject: Re: FW: Do_rootfs failure with tools-sdk	in	EXTRA_IMAGE_FEATURES
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
X-List-Received-Date: Wed, 08 Jan 2014 05:13:17 -0000
Content-type: multipart/alternative;
	boundary=----5T2IS1ITC4SHUTVRBE96PBVW26GNSP
Content-transfer-encoding: 8bit

------5T2IS1ITC4SHUTVRBE96PBVW26GNSP
Content-Transfer-Encoding: 8bit
Content-Type: text/plain;
 charset=UTF-8

"Srinivasan, Nageswari" <nageswari@ti.com> wrote:
>Mrinmayee,
>
>I am also facing similar issues while building for EPOS SDK.
>
>Installing packagegroup-arago-tisdk-amsdk-sdk-host (1.0-r17) to root...
>| Downloading
>file:/db/swcoe_epos2/a0393278/yocto/oe-layersetup/build/arago-tmp-external-linaro-toolchain/deploy/ipk/am438x_epos_evm/packagegroup-arago-tisdk-amsdk-sdk-host_1.0-r17_am438x_epos_evm.ipk.
>| Installing packagegroup-arago-tisdk-epossdk-sdk-host (1.0-r1) to
>root...
>| Downloading
>file:/db/swcoe_epos2/a0393278/yocto/oe-layersetup/build/arago-tmp-external-linaro-toolchain/deploy/ipk/am438x_epos_evm/packagegroup-arago-tisdk-epossdk-sdk-host_1.0-r1_am438x_epos_evm.ipk.
>| Collected errors:
>|  * satisfy_dependencies_for: Cannot satisfy the following
>dependencies for packagegroup-arago-tisdk-addons-sdk-host:
>|  *    arm-benchmarks-src *    am-sysinfo-src *       
>ti-linux-secure-examples-src *  oprofile-example-src *
>|  * opkg_install_cmd: Cannot install package
>packagegroup-arago-tisdk-addons-sdk-host.
>|  * satisfy_dependencies_for: Cannot satisfy the following
>dependencies for packagegroup-arago-tisdk-matrix-sdk-host:
>|  *    matrix-gui-src *
>|  * opkg_install_cmd: Cannot install package
>packagegroup-arago-tisdk-matrix-sdk-host.
>|  * satisfy_dependencies_for: Cannot satisfy the following
>dependencies for packagegroup-arago-tisdk-amsdk-sdk-host:
>|  *    u-boot-am43xx-src *     linux-am43xx-src *     
>oe-layersetup-src *
>|  * opkg_install_cmd: Cannot install package
>packagegroup-arago-tisdk-amsdk-sdk-host.
>|  * satisfy_dependencies_for: Cannot satisfy the following
>dependencies for packagegroup-arago-tisdk-epossdk-sdk-host:
>|  *    starterware-src *       examples-src *  ppa-am438x-epos-evm-src
>*
>|  * opkg_install_cmd: Cannot install package
>packagegroup-arago-tisdk-epossdk-sdk-host.
>
>Regards,
>Nageswari
>
>
>From: meta-arago-bounces@arago-project.org
>[mailto:meta-arago-bounces@arago-project.org] On Behalf Of Hingolikar,
>Mrinmayee
>Sent: Wednesday, January 08, 2014 10:34 AM
>To: meta-arago@arago-project.org
>Cc: R, Karthik
>Subject: [meta-arago] FW: Do_rootfs failure with tools-sdk in
>EXTRA_IMAGE_FEATURES
>
>
>Hi all,
>
>I am trying to add development tools in the filesystem. After adding
>tools-sdk in EXTRA_IMAGE_FEATURES, the build failed in the rootfs task.
>Snapshot of the log:
>Collected errors:
>* satisfy_dependencies_for: Cannot satisfy the following dependencies
>for packagegroup-core-sdk:
>*      ldd *
>* opkg_install_cmd: Cannot install package packagegroup-core-sdk.
>
>Ldd package provided by eglibc is not getting built.
>
>Similar errors was seen when I built arago-console-image with the
>arago-dylan-config.
>Is this a known issue and any pointers to resolve it?
>
>Regards,
>Mrinmayee
>
>
>
>------------------------------------------------------------------------
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

It fails in the same place, but for a completely different reason - you are trying to install host-side packages into a target rootfs...

-- 
Denys

------5T2IS1ITC4SHUTVRBE96PBVW26GNSP
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: 8bit

<html v="urn:schemas-microsoft-com:vml" o="urn:schemas-microsoft-com:office:office" w="urn:schemas-microsoft-com:office:word" m="http://schemas.microsoft.com/office/2004/12/omml"><head><meta http-equiv="Content-Type" content="text/html; charset=Windows-1252" /><meta name="Generator" content="Microsoft Word 14 (filtered medium)" /><style><!--
/* Font Definitions */
@font-face
 {font-family:Calibri;
 panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
 {font-family:Tahoma;
 panose-1:2 11 6 4 3 5 4 4 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
 {margin:0in;
 margin-bottom:.0001pt;
 font-size:11.0pt;
 font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
 {mso-style-priority:99;
 color:blue;
 text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
 {mso-style-priority:99;
 color:purple;
 text-decoration:underline;}
span.EmailStyle17
 {mso-style-type:personal;
 font-family:"Calibri","sans-serif";
 color:windowtext;}
span.EmailStyle18
 {mso-style-type:personal;
 font-family:"Calibri","sans-serif";
 color:#1F497D;}
span.EmailStyle19
 {mso-style-type:personal-reply;
 font-family:"Calibri","sans-serif";
 color:#1F497D;}
.MsoChpDefault
 {mso-style-type:export-only;
 font-size:10.0pt;}
@page WordSection1
 {size:8.5in 11.0in;
 margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
 {page:WordSection1;}
--></style></head><body lang="EN-US" link="blue" vlink="purple"><div class="gmail_quote">&quot;Srinivasan, Nageswari&quot; &lt;nageswari@ti.com&gt; wrote:<blockquote class="gmail_quote" style="margin: 0pt 0pt 0pt 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">




<!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->


<div class="WordSection1">
<p class="MsoNormal"><span style="color:#1F497D">Mrinmayee,<p></p></span></p>
<p class="MsoNormal"><span style="color:#1F497D"><p>&nbsp;</p></span></p>
<p class="MsoNormal"><span style="color:#1F497D">I am also facing similar issues while building for EPOS SDK.
<p></p></span></p>
<p class="MsoNormal"><span style="color:#1F497D"><p>&nbsp;</p></span></p>
<p class="MsoNormal"><span style="color:#1F497D">Installing packagegroup-arago-tisdk-amsdk-sdk-host (1.0-r17) to root...<p></p></span></p>
<p class="MsoNormal"><span style="color:#1F497D">| Downloading file:/db/swcoe_epos2/a0393278/yocto/oe-layersetup/build/arago-tmp-external-linaro-toolchain/deploy/ipk/am438x_epos_evm/packagegroup-arago-tisdk-amsdk-sdk-host_1.0-r17_am438x_epos_evm.ipk.<p></p></span></p>
<p class="MsoNormal"><span style="color:#1F497D">| Installing packagegroup-arago-tisdk-epossdk-sdk-host (1.0-r1) to root...<p></p></span></p>
<p class="MsoNormal"><span style="color:#1F497D">| Downloading file:/db/swcoe_epos2/a0393278/yocto/oe-layersetup/build/arago-tmp-external-linaro-toolchain/deploy/ipk/am438x_epos_evm/packagegroup-arago-tisdk-epossdk-sdk-host_1.0-r1_am438x_epos_evm.ipk.<p></p></span></p>
<p class="MsoNormal"><span style="color:#1F497D">| Collected errors:<p></p></span></p>
<p class="MsoNormal"><span style="color:#1F497D">|&nbsp; * satisfy_dependencies_for: Cannot satisfy the following dependencies for packagegroup-arago-tisdk-addons-sdk-host:<p></p></span></p>
<p class="MsoNormal"><span style="color:#1F497D">|&nbsp; *&nbsp;&nbsp;&nbsp; arm-benchmarks-src *&nbsp;&nbsp;&nbsp; am-sysinfo-src *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ti-linux-secure-examples-src *&nbsp; oprofile-example-src *<p></p></span></p>
<p class="MsoNormal"><span style="color:#1F497D">|&nbsp; * opkg_install_cmd: Cannot install package packagegroup-arago-tisdk-addons-sdk-host.<p></p></span></p>
<p class="MsoNormal"><span style="color:#1F497D">|&nbsp; * satisfy_dependencies_for: Cannot satisfy the following dependencies for packagegroup-arago-tisdk-matrix-sdk-host:<p></p></span></p>
<p class="MsoNormal"><span style="color:#1F497D">|&nbsp; *&nbsp;&nbsp;&nbsp; matrix-gui-src *<p></p></span></p>
<p class="MsoNormal"><span style="color:#1F497D">|&nbsp; * opkg_install_cmd: Cannot install package packagegroup-arago-tisdk-matrix-sdk-host.<p></p></span></p>
<p class="MsoNormal"><span style="color:#1F497D">|&nbsp; * satisfy_dependencies_for: Cannot satisfy the following dependencies for packagegroup-arago-tisdk-amsdk-sdk-host:<p></p></span></p>
<p class="MsoNormal"><span style="color:#1F497D">|&nbsp; *&nbsp;&nbsp;&nbsp; u-boot-am43xx-src *&nbsp;&nbsp;&nbsp;&nbsp; linux-am43xx-src *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; oe-layersetup-src *<p></p></span></p>
<p class="MsoNormal"><span style="color:#1F497D">|&nbsp; * opkg_install_cmd: Cannot install package packagegroup-arago-tisdk-amsdk-sdk-host.<p></p></span></p>
<p class="MsoNormal"><span style="color:#1F497D">|&nbsp; * satisfy_dependencies_for: Cannot satisfy the following dependencies for packagegroup-arago-tisdk-epossdk-sdk-host:<p></p></span></p>
<p class="MsoNormal"><span style="color:#1F497D">|&nbsp; *&nbsp;&nbsp;&nbsp; starterware-src *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; examples-src *&nbsp; ppa-am438x-epos-evm-src *<p></p></span></p>
<p class="MsoNormal"><span style="color:#1F497D">|&nbsp; * opkg_install_cmd: Cannot install package packagegroup-arago-tisdk-epossdk-sdk-host.<p></p></span></p>
<p class="MsoNormal"><span style="color:#1F497D"><p>&nbsp;</p></span></p>
<p class="MsoNormal"><span style="color:#1F497D">Regards,<p></p></span></p>
<p class="MsoNormal"><span style="color:#1F497D">Nageswari<p></p></span></p>
<p class="MsoNormal"><span style="color:#1F497D"><p>&nbsp;</p></span></p>
<p class="MsoNormal"><span style="color:#1F497D"><p>&nbsp;</p></span></p>
<div style="border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in 4.0pt">
<div>
<div style="border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in 0in 0in">
<p class="MsoNormal"><b><span style="font-size:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style="font-size:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago-project.org]
<b>On Behalf Of </b>Hingolikar, Mrinmayee<br />
<b>Sent:</b> Wednesday, January 08, 2014 10:34 AM<br />
<b>To:</b> meta-arago@arago-project.org<br />
<b>Cc:</b> R, Karthik<br />
<b>Subject:</b> [meta-arago] FW: Do_rootfs failure with tools-sdk in EXTRA_IMAGE_FEATURES<p></p></span></p>
</div>
</div>
<p class="MsoNormal"></p><p>&nbsp;</p>
<p class="MsoNormal"></p><p>&nbsp;</p>
<p class="MsoNormal">Hi all,</p><p></p>
<p class="MsoNormal"></p><p>&nbsp;</p>
<p class="MsoNormal">I am trying to add development tools in the filesystem. After adding tools-sdk in EXTRA_IMAGE_FEATURES, the build failed in the rootfs task. Snapshot of the log:</p><p></p>
<p class="MsoNormal"><span style="color:red">Collected errors:<p></p></span></p>
<p class="MsoNormal"><span style="color:red">* satisfy_dependencies_for: Cannot satisfy the following dependencies for packagegroup-core-sdk:<p></p></span></p>
<p class="MsoNormal"><span style="color:red">*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ldd *<p></p></span></p>
<p class="MsoNormal"><span style="color:red">* opkg_install_cmd: Cannot install package packagegroup-core-sdk.<p></p></span></p>
<p class="MsoNormal"><span style="color:red"><p>&nbsp;</p></span></p>
<p class="MsoNormal">Ldd package provided by eglibc is not getting built.</p><p></p>
<p class="MsoNormal"></p><p>&nbsp;</p>
<p class="MsoNormal">Similar errors was seen when I built arago-console-image with the
<b>arago-dylan-config.</b></p><p><b></b></p>
<p class="MsoNormal">Is this a known issue and any pointers to resolve it?</p><p></p>
<p class="MsoNormal"></p><p>&nbsp;</p>
<p class="MsoNormal">Regards,</p><p></p>
<p class="MsoNormal">Mrinmayee</p><p></p>
<p class="MsoNormal"></p><p>&nbsp;</p>
</div>
</div>


<p style="margin-top: 2.5em; margin-bottom: 1em; border-bottom: 1px solid #000"></p><pre class="k9mail"><hr /><br />meta-arago mailing list<br />meta-arago@arago-project.org<br /><a href="http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago">http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago</a><br /></pre></blockquote></div><br clear="all">It fails in the same place, but for a completely different reason - you are trying to install host-side packages into a target rootfs...<br>
<br>
-- <br>
Denys</body></html>

------5T2IS1ITC4SHUTVRBE96PBVW26GNSP--
