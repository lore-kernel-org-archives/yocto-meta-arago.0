Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTP id 8C97C52972
	for <meta-arago@arago-project.org>;
	Thu,  9 Jan 2014 14:31:34 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [96.231.138.104])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MZ500FB71O39S50@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 09 Jan 2014 08:31:31 -0600 (CST)
Received: from android-613965610fc6ed9f.denix (unknown [192.168.0.122])
	by gandalf.denix.org (Postfix) with ESMTPA id 5826C2008D; Thu,
	09 Jan 2014 09:31:12 -0500 (EST)
User-Agent: K-9 Mail for Android
In-reply-to: <CF956B779D819D41BBC043B7082161D5478FAA@DBDE04.ent.ti.com>
References: <CF956B779D819D41BBC043B7082161D5478FAA@DBDE04.ent.ti.com>
MIME-version: 1.0
From: Denys Dmytriyenko <denis@denix.org>
Date: Thu, 09 Jan 2014 09:31:10 -0500
To: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Message-id: <206773bd-5a0c-4f4f-92a5-bc56453ed733@email.android.com>
Subject: Re: Openssl build failure
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
X-List-Received-Date: Thu, 09 Jan 2014 14:31:35 -0000
Content-type: multipart/alternative;
	boundary=----5ISGQ94F12ODSVDTHREQAB65KGEON9
Content-transfer-encoding: 8bit

------5ISGQ94F12ODSVDTHREQAB65KGEON9
Content-Transfer-Encoding: 8bit
Content-Type: text/plain;
 charset=UTF-8

"Hingolikar, Mrinmayee" <mrinmayee@ti.com> wrote:
>
>Hi all,
>
>I am facing a openssl build failure on some of the 64-bit machines . In
>the recipe the dependency "ocf-linux " is replaced by null for
>dra7xx-evm.
>However, on certain machines, it adds a dependency ocf-linux-native
>that conflicts with cryptodev, resulting in these errors:
>
>WARNING: The recipe ocf-linux is trying to install files into a shared
>area when those files already exist. Those files and their manifest
>location are:
>/home/x0161644/glsdk/ti-glsdk_dra7xx-evm_6_03_00_01/yocto-layers/build/arago-tmp-external-linaro-toolchain/sysroots/dra7xx-evm/usr/include/crypto/cryptodev.h
>   Matched in manifest-dra7xx-evm-cryptodev
>Please verify which package should provide the above files.
>ERROR: Function failed: do_compile (see
>/home/x0161644/glsdk/ti-glsdk_dra7xx-evm_6_03_00_01/yocto-layers/build/arago-tmp-external-linaro-toolchain/work/dra7xx_evm-oe-linux-gnueabi/openssl/1.0.1e-r15.0-arago8/temp/log.do_compile.29620
>for further information)
>ERROR: Logfile of failure stored in:
>/home/x0161644/glsdk/ti-glsdk_dra7xx-evm_6_03_00_01/yocto-layers/build/arago-tmp-external-linaro-toolchain/work/dra7xx_evm-oe-linux-gnueabi/openssl/1.0.1e-r15.0-arago8/temp/log.do_compile.29620
>
>
>To circumvent these, I have added the following line in
>-arago-extras/recipes-kernel/cryptodev/cryptodev_1.6.bb:
>RREPLACES_${PN}_append_dra7xx-evm = "ocf-linux"
>
>Is this the correct approach?
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

Are you missing this fix from last month:

http://arago-project.org/git/?p=meta-arago.git;a=commitdiff;h=94b6c0eb7a4eac27011af62381fdcb263e3dfbd7

-- 
Denys

------5ISGQ94F12ODSVDTHREQAB65KGEON9
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
<p class="MsoNormal">I am facing a openssl build failure on some of the 64-bit machines . In the recipe the dependency &#8220;ocf-linux &#8221; is replaced by null for dra7xx-evm.</p><p></p>
<p class="MsoNormal">However, on certain machines, it adds a dependency ocf-linux-native that conflicts with cryptodev, resulting in these errors:</p><p></p>
<p class="MsoNormal"></p><p>&nbsp;</p>
<p class="MsoNormal"><u><span style="font-size:8.0pt;font-family:&quot;Courier New&quot;;color:red">WARNING: The recipe ocf-linux is trying to install files into a shared area when those files already exist. Those files and their manifest location are:<p></p></span></u></p>
<p class="MsoNormal"><u><span style="font-size:8.0pt;font-family:&quot;Courier New&quot;;color:red">&nbsp;&nbsp; /home/x0161644/glsdk/ti-glsdk_dra7xx-evm_6_03_00_01/yocto-layers/build/arago-tmp-external-linaro-toolchain/sysroots/dra7xx-evm/usr/include/crypto/cryptodev.h<p></p></span></u></p>
<p class="MsoNormal"><u><span style="font-size:8.0pt;font-family:&quot;Courier New&quot;;color:red">&nbsp;&nbsp; Matched in manifest-dra7xx-evm-cryptodev<p></p></span></u></p>
<p class="MsoNormal"><span style="font-size:8.0pt;font-family:&quot;Courier New&quot;;color:red">Please verify which package should provide the above files.<p></p></span></p>
<p class="MsoNormal"><span style="font-size:8.0pt;font-family:&quot;Courier New&quot;;color:red">ERROR: Function failed: do_compile (see /home/x0161644/glsdk/ti-glsdk_dra7xx-evm_6_03_00_01/yocto-layers/build/arago-tmp-external-linaro-toolchain/work/dra7xx_evm-oe-linux-gnueabi/openssl/1.0.1e-r15.0-arago8/temp/log.do_compile.29620
 for further information)<p></p></span></p>
<p class="MsoNormal"><span style="font-size:8.0pt;font-family:&quot;Courier New&quot;;color:red">ERROR: Logfile of failure stored in: /home/x0161644/glsdk/ti-glsdk_dra7xx-evm_6_03_00_01/yocto-layers/build/arago-tmp-external-linaro-toolchain/work/dra7xx_evm-oe-linux-gnueabi/openssl/1.0.1e-r15.0-arago8/temp/log.do_compile.29620<p></p></span></p>
<p class="MsoNormal"></p><p>&nbsp;</p>
<p class="MsoNormal"></p><p>&nbsp;</p>
<p class="MsoNormal">To circumvent these, I have added the following line in -arago-extras/recipes-kernel/cryptodev/cryptodev_1.6.bb:</p><p></p>
<p class="MsoNormal"><b>RREPLACES_${PN}_append_dra7xx-evm = &quot;ocf-linux&quot;</b></p><p><b></b></p>
<p class="MsoNormal"><b></b></p><p><b>&nbsp;</b></p>
<p class="MsoNormal">Is this the correct approach?</p><p></p>
<p class="MsoNormal"></p><p>&nbsp;</p>
<p class="MsoNormal">Regards,</p><p></p>
<p class="MsoNormal">Mrinmayee</p><p></p>
<p class="MsoNormal"></p><p>&nbsp;</p>
</div>


<p style="margin-top: 2.5em; margin-bottom: 1em; border-bottom: 1px solid #000"></p><pre class="k9mail"><hr /><br />meta-arago mailing list<br />meta-arago@arago-project.org<br /><a href="http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago">http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago</a><br /></pre></blockquote></div><br clear="all">Are you missing this fix from last month:<br>
<br>
<a href="http://arago-project.org/git/?p=meta-arago.git;a=commitdiff;h=94b6c0eb7a4eac27011af62381fdcb263e3dfbd7">http://arago-project.org/git/?p=meta-arago.git;a=commitdiff;h=94b6c0eb7a4eac27011af62381fdcb263e3dfbd7</a><br>
<br>
-- <br>
Denys</body></html>

------5ISGQ94F12ODSVDTHREQAB65KGEON9--
