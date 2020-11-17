Return-Path: <dmurphy@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id BB2A352968
	for <meta-arago@arago-project.org>;
	Tue, 17 Nov 2020 19:42:45 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AHJghHR053297;
	Tue, 17 Nov 2020 13:42:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1605642163;
	bh=kksdXvLj2ugfT6zgUTs1yvlftFiequMIXtubnwaywkc=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=bJgW0SEFn5Rkf85cbRfPT0Q2kjcVX6e3O0bY57hb4HMRA8jFU9wtOt17/dAch22FD
	sUTueRYI2HwDz6EXopA2ypVC5Mfj1KnF9y62M6QYzoP+EMuonQRPYa4Osow8upLIqv
	o6PRkFn++9wV9jVtC23dDUVQALJmljlMlw5X8b/w=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AHJghNR029680
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Nov 2020 13:42:43 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Tue, 17 Nov 2020 13:42:43 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Tue, 17 Nov 2020 13:42:43 -0600
Received: from [10.250.70.26] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AHJgfn2050767;
	Tue, 17 Nov 2020 13:42:42 -0600
To: Paul Barker <pbarker@konsulko.com>, <meta-arago@arago-project.org>,
	<meta-ti@lists.yoctoproject.org>
References: <CAM9ZRVua_tLGXPZ76A0Su2yzhKD=-=un_G33-UGJbsKAzh0t_w@mail.gmail.com>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <94da8736-0000-a797-8f20-f766feb1f1df@ti.com>
Date: Tue, 17 Nov 2020 13:42:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAM9ZRVua_tLGXPZ76A0Su2yzhKD=-=un_G33-UGJbsKAzh0t_w@mail.gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [meta-ti] How to tell when meta-ti/meta-arago or TI CoreSDK is released
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
X-List-Received-Date: Tue, 17 Nov 2020 19:42:46 -0000
Content-Type: multipart/alternative;
	boundary="------------19D860036B0575CB0BCA00BF"
Content-Language: en-US

--------------19D860036B0575CB0BCA00BF
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Paul

On 11/17/20 1:17 PM, Paul Barker wrote:
> Hey folks, apologies if this isn't the right place to ask but I can't
> see where else I should be asking this question.
>
> The Sancloud BSP layer (meta-sancloud) depends on both meta-arago and
> meta-ti. For our Arago builds I typically pin release versions of
> these dependency layers, especially for meta-arago and meta-ti I want
> to ensure that we're using known good versions. The tag we're
> currently pinned to is 07.00.00.005 which I believe corresponds to a
> TI CoreSDK release. I see there are some new tags in these layers and
> in the ti-linux-kernel repository
>
> I also see that configs have been added to the oe-layersetup
> repository which is usually my flag that something has been released.
> However, in oe-layersetup both 07.01.00.004 and 07.01.00.005 have been
> given config files while the meta-arago layer, meta-ti layer and
> ti-linux-kernel recipes are up to 07.01.00.006. So my usual heuristics
> are a bit confused.
>
> I've tried searching for "ti coresdk" in google but I can't find any
> documentation for this. I've also tried looking at the Arago wiki but
> this does not look to have been updated recently. The only list of
> branches I can find is
> http://arago-project.org/wiki/index.php/Setting_Up_Build_Environment
> which is definitely obsolete.
>
> So all I can do is ask the question then - how do I find out when a
> release of Arago (or TI CoreSDK) is ready to pick up and use?
This is on my to do for next year to try to document expected release dates.
>
> To pre-empt the obvious question - we do test with the HEAD of the
> dunfell branch of layers regularly but we're not happy to issue a
> release of our own BSP without ensuring we're aligned on released
> versions of the underlying layers where possible. We need to track the
> releases in the ti-linux-kernel layer as we've seen in the past that
> our kernel needs to match with the expectations of the meta-ti layer
> if we want the PowerVR drivers to work.

Sorry for all the confusion. I created those additional configs for our 
internal SDK consumers.

The official release will be 07.01.00.006 and I will be pushing that 
config shortly.

Yes I understand the issue with the PVR modules and kernel dependencies.

Dan


> Thanks,
>
>
> 
>

--------------19D860036B0575CB0BCA00BF
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Paul<br>
    </p>
    <div class="moz-cite-prefix">On 11/17/20 1:17 PM, Paul Barker wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAM9ZRVua_tLGXPZ76A0Su2yzhKD=-=un_G33-UGJbsKAzh0t_w@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">Hey folks, apologies if this isn't the right place to ask but I can't
see where else I should be asking this question.

The Sancloud BSP layer (meta-sancloud) depends on both meta-arago and
meta-ti. For our Arago builds I typically pin release versions of
these dependency layers, especially for meta-arago and meta-ti I want
to ensure that we're using known good versions. The tag we're
currently pinned to is 07.00.00.005 which I believe corresponds to a
TI CoreSDK release. I see there are some new tags in these layers and
in the ti-linux-kernel repository

I also see that configs have been added to the oe-layersetup
repository which is usually my flag that something has been released.
However, in oe-layersetup both 07.01.00.004 and 07.01.00.005 have been
given config files while the meta-arago layer, meta-ti layer and
ti-linux-kernel recipes are up to 07.01.00.006. So my usual heuristics
are a bit confused.

I've tried searching for "ti coresdk" in google but I can't find any
documentation for this. I've also tried looking at the Arago wiki but
this does not look to have been updated recently. The only list of
branches I can find is
<a class="moz-txt-link-freetext" href="http://arago-project.org/wiki/index.php/Setting_Up_Build_Environment">http://arago-project.org/wiki/index.php/Setting_Up_Build_Environment</a>
which is definitely obsolete.

So all I can do is ask the question then - how do I find out when a
release of Arago (or TI CoreSDK) is ready to pick up and use?</pre>
    </blockquote>
    This is on my to do for next year to try to document expected
    release dates.<br>
    <blockquote type="cite"
cite="mid:CAM9ZRVua_tLGXPZ76A0Su2yzhKD=-=un_G33-UGJbsKAzh0t_w@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

To pre-empt the obvious question - we do test with the HEAD of the
dunfell branch of layers regularly but we're not happy to issue a
release of our own BSP without ensuring we're aligned on released
versions of the underlying layers where possible. We need to track the
releases in the ti-linux-kernel layer as we've seen in the past that
our kernel needs to match with the expectations of the meta-ti layer
if we want the PowerVR drivers to work.
</pre>
    </blockquote>
    <p>Sorry for all the confusion. I created those additional configs
      for our internal SDK consumers.</p>
    <p>The official release will be 07.01.00.006 and I will be pushing
      that config shortly.</p>
    <p>Yes I understand the issue with the PVR modules and kernel
      dependencies.<br>
    </p>
    <p>Dan<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:CAM9ZRVua_tLGXPZ76A0Su2yzhKD=-=un_G33-UGJbsKAzh0t_w@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">
Thanks,

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------19D860036B0575CB0BCA00BF--
