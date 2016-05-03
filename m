Return-Path: <j-stiffler@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 8227E52A65
	for <meta-arago@arago-project.org>;
	Tue,  3 May 2016 12:25:28 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u43CPRHb016583
	for <meta-arago@arago-project.org>; Tue, 3 May 2016 07:25:27 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u43CPR4u017399
	for <meta-arago@arago-project.org>; Tue, 3 May 2016 07:25:27 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 3 May 2016 07:25:27 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u43CPROP024206	for
	<meta-arago@arago-project.org>; Tue, 3 May 2016 07:25:27 -0500
Message-ID: <572898B7.4050309@ti.com>
Date: Tue, 3 May 2016 08:25:27 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
References: <4B26FB5A64EBA14C87266869E037F9581426AF5A@DFLE09.ent.ti.com>
In-Reply-To: <4B26FB5A64EBA14C87266869E037F9581426AF5A@DFLE09.ent.ti.com>
Subject: Re: k2 build failures
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
X-List-Received-Date: Tue, 03 May 2016 12:25:30 -0000
Content-Type: multipart/alternative;
	boundary="------------030009020205000206020304"

--------------030009020205000206020304
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit



On 5/2/2016 2:59 PM, Stiffler, Jacob wrote:
>
> With migrating to krogoth, the k2 build failures are due to conflicts 
> between the ocl-gl-headers and mesa, and I’ve discovered why mesa is 
> being pulled in.
>
> In the opencv recipe, we are inheriting “cmake_qt5”. This bbclass was 
> changed to add the dependency on qtbase, and this brings in mesa for 
> keystone.
>
> I’m not sure of the best way to handle this. The easiest hack is the 
> remove qtbase from the opencv dependencies for keystone only.
>
> Would it be possible to replace opencl’s dependency on 
> “ocl-gl-headers” with “mesa-gl”? In the past, I made some attempts to 
> use “mesa”, but with the SGX platforms, there was always a conflict 
> with the ti sgx drivers, as both were installing common gles files. I 
> do not remember mesa-gl being an option before.
>

I treid replacing opencl's dependency on ocl-gl-headers with 
virtual/libgl. This appears to work for keystone, but for am57xx-evm, 
there is a conflict between mesa-gl and libgbm recipes as mesa-gl also 
provides a libgbm package. How can this conflict be resolved?

> Thank you,
>
> Jake
>
>
>
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


--------------030009020205000206020304
Content-Type: text/html; charset="windows-1252"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <br>
    <br>
    <div class="moz-cite-prefix">On 5/2/2016 2:59 PM, Stiffler, Jacob
      wrote:<br>
    </div>
    <blockquote
      cite="mid:4B26FB5A64EBA14C87266869E037F9581426AF5A@DFLE09.ent.ti.com"
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
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
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
        <p class="MsoNormal">With migrating to krogoth, the k2 build
          failures are due to conflicts between the ocl-gl-headers and
          mesa, and I’ve discovered why mesa is being pulled in.
          <o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">In the opencv recipe, we are inheriting
          “cmake_qt5”. This bbclass was changed to add the dependency on
          qtbase, and this brings in mesa for keystone.<o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">I’m not sure of the best way to handle
          this. The easiest hack is the remove qtbase from the opencv
          dependencies for keystone only.
          <o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">Would it be possible to replace opencl’s
          dependency on “ocl-gl-headers” with “mesa-gl”? In the past, I
          made some attempts to use “mesa”, but with the SGX platforms,
          there was always a conflict with the ti sgx drivers, as both
          were installing common gles files. I do not remember mesa-gl
          being an option before.<o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
      </div>
    </blockquote>
    <br>
    I treid replacing opencl's dependency on ocl-gl-headers with
    virtual/libgl. This appears to work for keystone, but for
    am57xx-evm, there is a conflict between mesa-gl and libgbm recipes
    as mesa-gl also provides a libgbm package. How can this conflict be
    resolved?<br>
    <br>
    <blockquote
      cite="mid:4B26FB5A64EBA14C87266869E037F9581426AF5A@DFLE09.ent.ti.com"
      type="cite">
      <div class="WordSection1">
        <p class="MsoNormal">Thank you,<o:p></o:p></p>
        <p class="MsoNormal">Jake <o:p></o:p></p>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">_______________________________________________
meta-arago mailing list
<a class="moz-txt-link-abbreviated" href="mailto:meta-arago@arago-project.org">meta-arago@arago-project.org</a>
<a class="moz-txt-link-freetext" href="http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago">http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------030009020205000206020304--
