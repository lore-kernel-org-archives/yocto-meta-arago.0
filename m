Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTP id CFB0E52A67
	for <meta-arago@arago-project.org>;
	Wed,  8 Jan 2014 05:08:16 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [96.231.138.104])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MZ200H43GX7MV70@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 07 Jan 2014 23:08:01 -0600 (CST)
Received: from android-613965610fc6ed9f.denix (unknown [192.168.0.122])
	by gandalf.denix.org (Postfix) with ESMTPA id 0EB992008E; Wed,
	08 Jan 2014 00:07:55 -0500 (EST)
User-Agent: K-9 Mail for Android
In-reply-to: <CF956B779D819D41BBC043B7082161D5478BBE@DBDE04.ent.ti.com>
References: <CF956B779D819D41BBC043B7082161D5478BBE@DBDE04.ent.ti.com>
MIME-version: 1.0
From: Denys Dmytriyenko <denis@denix.org>
Date: Wed, 08 Jan 2014 00:07:51 -0500
To: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Message-id: <4233e440-1ae1-4eaa-bad9-5daeb3a77408@email.android.com>
Cc: "R, Karthik" <karthik.ramanan@ti.com>
Subject: Re: FW: Do_rootfs failure with tools-sdk in	EXTRA_IMAGE_FEATURES
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
X-List-Received-Date: Wed, 08 Jan 2014 05:08:17 -0000
Content-type: multipart/alternative;
	boundary=----9LPH3FJAJR10KXSV0L9ROOEMF06N87
Content-transfer-encoding: 8bit

------9LPH3FJAJR10KXSV0L9ROOEMF06N87
Content-Transfer-Encoding: 8bit
Content-Type: text/plain;
 charset=UTF-8

"Hingolikar, Mrinmayee" <mrinmayee@ti.com> wrote:
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

We don't build eglibc, as we use a prebuilt one from the Linaro toolchain and it does not provide ldd. Where did you get tools-sdk from?

-- 
Denys

------9LPH3FJAJR10KXSV0L9ROOEMF06N87
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: 8bit

<html v="urn:schemas-microsoft-com:vml" o="urn:schemas-microsoft-com:office:office" w="urn:schemas-microsoft-com:office:word" m="http://schemas.microsoft.com/office/2004/12/omml"><head><meta http-equiv="Content-Type" content="text/html; charset=us-ascii" /><meta name="Generator" content="Microsoft Word 12 (filtered medium)" /><style><!--
/* Font Definitions */
@font-face
 {font-family:"Cambria Math";
 panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
 {font-family:Calibri;
 panose-1:2 15 5 2 2 2 4 3 2 4;}
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
--></style></head><body lang="EN-US" link="blue" vlink="purple"><div class="gmail_quote">&quot;Hingolikar, Mrinmayee&quot; &lt;mrinmayee@ti.com&gt; wrote:<blockquote class="gmail_quote" style="margin: 0pt 0pt 0pt 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">




<!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->


<div class="WordSection1">
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


<p style="margin-top: 2.5em; margin-bottom: 1em; border-bottom: 1px solid #000"></p><pre class="k9mail"><hr /><br />meta-arago mailing list<br />meta-arago@arago-project.org<br /><a href="http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago">http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago</a><br /></pre></blockquote></div><br clear="all">We don&#39;t build eglibc, as we use a prebuilt one from the Linaro toolchain and it does not provide ldd. Where did you get tools-sdk from?<br>
<br>
-- <br>
Denys</body></html>

------9LPH3FJAJR10KXSV0L9ROOEMF06N87--
