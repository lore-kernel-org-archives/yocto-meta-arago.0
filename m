Return-Path: <karthik.ramanan@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by arago-project.org (Postfix) with ESMTPS id AA15D52A5F
	for <meta-arago@arago-project.org>;
	Mon,  1 Aug 2016 10:59:00 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u71Awxl5022126
	for <meta-arago@arago-project.org>; Mon, 1 Aug 2016 05:58:59 -0500
Received: from dbdlxv05.itg.ti.com (dbdlxv05.itg.ti.com [172.24.171.60])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u71Aww02001550
	for <meta-arago@arago-project.org>; Mon, 1 Aug 2016 05:58:59 -0500
Received: from DBDE72.ent.ti.com (dbdmailx.itg.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id u71AwunU007586
	for <meta-arago@arago-project.org>; Mon, 1 Aug 2016 16:28:57 +0530
Received: from [172.24.158.157] (172.24.158.157) by DBDE72.ent.ti.com
	(172.24.171.97) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 1 Aug 2016 16:28:55 +0530
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
References: <4B26FB5A64EBA14C87266869E037F958142EFC43@DFLE09.ent.ti.com>
From: Karthik Ramanan <a0393906@ti.com>
Message-ID: <579F2B6F.8010908@ti.com>
Date: Mon, 1 Aug 2016 16:28:55 +0530
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <4B26FB5A64EBA14C87266869E037F958142EFC43@DFLE09.ent.ti.com>
X-Originating-IP: [172.24.158.157]
Cc: "R, Karthik" <karthik.ramanan@ti.com>
Subject: Re: gstreamer 1.6: bad plugins
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
X-List-Received-Date: Mon, 01 Aug 2016 10:59:01 -0000
Content-Type: multipart/alternative;
	boundary="------------030709040909010808050700"

--------------030709040909010808050700
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jake,

OK. I never thought about K2.

Should having another line for K2 similar to ti33x/ti44x and point to 
the same commit ID - "d0160ca810be30bf2b2e7681f5047933402efb52"fix the 
problem?
Most of the changes that TI is doing on top of the default GST plugins 
are related to hardware acceleration. And we don't have the IVAHD on the 
AM3 and AM4, they are pointing to the default a commit ID that 
corresponds to the default GST upstream package.

Could you please try the change for K2 and submit a patch if that works? 
I don't have board or environment to fix that really quick.

Regards
Karthik

On 01-Aug-16 4:22 PM, Stiffler, Jacob wrote:
>
> Karthik, Denys,
>
> We are seeing a failure with building the gstreamer1.0-plugins-bad for 
> k2 since upgrading to 1.6.
>
> In file included from 
> ../../../../git/gst-libs/gst/drm/gstdrmallocator.c:32:0:
>
> ../../../../git/gst-libs/gst/drm/gstdrmallocator.h:39:21: fatal error: 
> xf86drm.h: No such file or directory
>
> compilation terminated.
>
> Makefile:866: recipe for target 'libgstdrm_1.0_la-gstdrmallocator.lo' 
> failed
>
> make[4]: *** [libgstdrm_1.0_la-gstdrmallocator.lo] Error 1
>
> make[4]: Leaving directory 
> '/home/gtbldadm/processor-sdk-linux-krogoth-build/build-CORTEX_1/arago-tmp-external-linaro-toolchain/work/k2hk_evm-linux-gnueabi/gstreamer1.0-plugins-bad/1.6.3-r20/build/gst-libs/gst/drm'
>
> Makefile:1050: recipe for target 'drm' failed
>
> This appears to be related to 
> http://git.ti.com/glsdk/gstreamer1-0-plugins-bad/commit/04ee4d353888a210c5ee5792ff402eb8c3d3e6e4. 
> Is there a config option to disable the drm allocator?
>
> I am also curious as to why we are using different versions of these 
> plugins for ti33x and ti43x. Should k2 also use that commit? I am 
> referring to the lines in gstreamer1.0-plugins-bad_git.bbappend:
>
>   38 SRCREV = "f0694b5fcec997036ef7df4d382b28e833c8ebfd"
>
>   39 SRCREV_ti43x = "d0160ca810be30bf2b2e7681f5047933402efb52"
>
>   40 SRCREV_ti33x = "d0160ca810be30bf2b2e7681f5047933402efb52"
>
> Thank you,
>
> Jake
>


--------------030709040909010808050700
Content-Type: text/html; charset="windows-1252"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <tt>Hi Ja</tt><tt>ke,</tt><tt><br>
    </tt><tt><br>
    </tt><tt>OK. I never thought about K2.</tt><tt><br>
      <br>
    </tt><tt>Should having another line for K2 similar to ti33x/ti44x
      and point to the same commit ID - "</tt><tt>d0160ca810be30bf2b2e7681f5047933402efb52"</tt><tt>
      fix the problem?<br>
    </tt><tt>Most of the changes that TI is doing on top of the default
      GST plugins are related to hardware acceleration. And we don't
      have the IVAHD on the AM3 and AM4, they are pointing to the
      default a commit ID that corresponds to the default GST upstream
      package.<br>
      <br>
      Could you please try the change for K2 and submit a patch if that
      works? I don't have board or environment to fix that really quick.<br>
      <br>
      Regards<br>
      Karthik</tt><br>
    <br>
    <div class="moz-cite-prefix">On 01-Aug-16 4:22 PM, Stiffler, Jacob
      wrote:<br>
    </div>
    <blockquote
      cite="mid:4B26FB5A64EBA14C87266869E037F958142EFC43@DFLE09.ent.ti.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html;
        charset=windows-1252">
      <meta name="Generator" content="Microsoft Word 14 (filtered
        medium)">
      <style><!--
/* Font Definitions */
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
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:"Courier New";}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="MsoNormal">Karthik, Denys,<o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">We are seeing a failure with building the
          gstreamer1.0-plugins-bad for k2 since upgrading to 1.6.<o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal"><span
            style="font-size:10.0pt;font-family:&quot;Courier New&quot;">In
            file included from
            ../../../../git/gst-libs/gst/drm/gstdrmallocator.c:32:0:<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.0pt;font-family:&quot;Courier New&quot;">../../../../git/gst-libs/gst/drm/gstdrmallocator.h:39:21:
            fatal error: xf86drm.h: No such file or directory<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.0pt;font-family:&quot;Courier New&quot;">compilation
            terminated.<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.0pt;font-family:&quot;Courier New&quot;">Makefile:866:
            recipe for target 'libgstdrm_1.0_la-gstdrmallocator.lo'
            failed<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.0pt;font-family:&quot;Courier New&quot;">make[4]:
            *** [libgstdrm_1.0_la-gstdrmallocator.lo] Error 1<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.0pt;font-family:&quot;Courier New&quot;">make[4]:
            Leaving directory
'/home/gtbldadm/processor-sdk-linux-krogoth-build/build-CORTEX_1/arago-tmp-external-linaro-toolchain/work/k2hk_evm-linux-gnueabi/gstreamer1.0-plugins-bad/1.6.3-r20/build/gst-libs/gst/drm'<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.0pt;font-family:&quot;Courier New&quot;">Makefile:1050:
            recipe for target 'drm' failed<o:p></o:p></span></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">This appears to be related to <a
            moz-do-not-send="true"
href="http://git.ti.com/glsdk/gstreamer1-0-plugins-bad/commit/04ee4d353888a210c5ee5792ff402eb8c3d3e6e4"><a class="moz-txt-link-freetext" href="http://git.ti.com/glsdk/gstreamer1-0-plugins-bad/commit/04ee4d353888a210c5ee5792ff402eb8c3d3e6e4">http://git.ti.com/glsdk/gstreamer1-0-plugins-bad/commit/04ee4d353888a210c5ee5792ff402eb8c3d3e6e4</a></a>.
          Is there a config option to disable the drm allocator?<o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">I am also curious as to why we are using
          different versions of these plugins for ti33x and ti43x.
          Should k2 also use that commit? I am referring to the lines in
          gstreamer1.0-plugins-bad_git.bbappend:<o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">  38 SRCREV =
          "f0694b5fcec997036ef7df4d382b28e833c8ebfd"<o:p></o:p></p>
        <p class="MsoNormal">  39 SRCREV_ti43x =
          "d0160ca810be30bf2b2e7681f5047933402efb52"<o:p></o:p></p>
        <p class="MsoNormal">  40 SRCREV_ti33x =
          "d0160ca810be30bf2b2e7681f5047933402efb52"<o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">Thank you,<o:p></o:p></p>
        <p class="MsoNormal">Jake<o:p></o:p></p>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------030709040909010808050700--
