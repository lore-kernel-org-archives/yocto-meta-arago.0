Return-Path: <j-stiffler@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id C07BE52AB7
	for <meta-arago@arago-project.org>;
	Fri,  1 May 2015 14:26:42 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t41EQf7v019752
	for <meta-arago@arago-project.org>; Fri, 1 May 2015 09:26:41 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t41EQe0h009301
	for <meta-arago@arago-project.org>; Fri, 1 May 2015 09:26:40 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 1 May 2015 09:26:40 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t41EQdpf001044;
	Fri, 1 May 2015 09:26:39 -0500
Message-ID: <55438D20.6020203@ti.com>
Date: Fri, 1 May 2015 10:26:40 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>, <meta-arago@arago-project.org>
References: <1480745164.301.1430449311116.JavaMail.jenkins@puget>
	<20150501135817.GW29290@edge>
In-Reply-To: <20150501135817.GW29290@edge>
Subject: Re: [nightly] Core TISDK 2015.04 build 2015-04-30_22-00-51
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
X-List-Received-Date: Fri, 01 May 2015 14:26:46 -0000
Content-Type: multipart/alternative;
	boundary="------------010608090300060705060404"

--------------010608090300060705060404
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

I see the error:

make[3]: *** No rule to make target 
`../../gst-libs/gst/drm/libgstdrm-1.0.la', needed by 
`libgstwaylandsink.la'.  Stop.
make[3]: *** Waiting for unfinished jobs....

Looks like drm is needed for waylandsink. But I thought am3/am4 did not 
have DRM?




On 5/1/2015 9:58 AM, Denys Dmytriyenko wrote:
> Jake,
>
> gstreamer1.0-plugins-bad with your patch broke for am3/am4 platforms.
>
>
>
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


On 5/1/2015 9:58 AM, Denys Dmytriyenko wrote:
> Jake,
>
> gstreamer1.0-plugins-bad with your patch broke for am3/am4 platforms.
>
>
>
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


--------------010608090300060705060404
Content-Type: text/html; charset="windows-1252"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    I see the error:<br>
    <br>
    make[3]: *** No rule to make target
    `../../gst-libs/gst/drm/libgstdrm-1.0.la', needed by
    `libgstwaylandsink.la'.  Stop.<br>
    make[3]: *** Waiting for unfinished jobs....<br>
    <br>
    Looks like drm is needed for waylandsink. But I thought am3/am4 did
    not have DRM?<br>
    <br>
    <br>
    <br>
    <br>
    <div class="moz-cite-prefix">On 5/1/2015 9:58 AM, Denys Dmytriyenko
      wrote:<br>
    </div>
    <blockquote cite="mid:20150501135817.GW29290@edge" type="cite">
      <pre wrap="">Jake,

gstreamer1.0-plugins-bad with your patch broke for am3/am4 platforms.

</pre>
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
    <br>
    <div class="moz-cite-prefix">On 5/1/2015 9:58 AM, Denys Dmytriyenko
      wrote:<br>
    </div>
    <blockquote cite="mid:20150501135817.GW29290@edge" type="cite">
      <pre wrap="">Jake,

gstreamer1.0-plugins-bad with your patch broke for am3/am4 platforms.

</pre>
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

--------------010608090300060705060404--
