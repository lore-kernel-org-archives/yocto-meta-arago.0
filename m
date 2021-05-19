Return-Path: <nm@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 9FBE452BDC
	for <meta-arago@arago-project.org>;
	Wed, 19 May 2021 22:38:55 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14JMdUcK081620;
	Wed, 19 May 2021 17:39:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1621463970;
	bh=L19wARow+L0KcLjEzaTob57ARpKpHFmAzGMTmd+uxig=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=sH/Q4rBDt2W7oO+0xW5Lzwv1jU3le/RsE8DDJeM6FW0cOtTDFEKQHvuZ7UlITVbAM
	AtpnRCigJuGet839Iv8HqTa3LFDHVCJ1CD+rAxbBHUYCamcUmNjRf71xkdMRWdd2Th
	Iad6jxlD0ZI7ytU0jT5LX7GlKauVasuDjpI7fqAY=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14JMdUcD038025
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 19 May 2021 17:39:30 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Wed, 19 May 2021 17:39:30 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Wed, 19 May 2021 17:39:30 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14JMdTRN054518;
	Wed, 19 May 2021 17:39:29 -0500
Date: Wed, 19 May 2021 17:39:29 -0500
From: Nishanth Menon <nm@ti.com>
To: <roopangkumar.patel@ti.com>
Message-ID: <20210519223929.n3oidsaag5wikia6@chamber>
References: <20210519124642.21701-1-roopangkumar.patel@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210519124642.21701-1-roopangkumar.patel@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org, prashanth.amai@ti.com,
	praveen.ap@pathpartnertech.com, sidraya.bj@pathpartnertech.com
Subject: Re: [PATCH] v4l2 H264 encoder plugin changes
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
X-List-Received-Date: Wed, 19 May 2021 22:38:56 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 18:16-20210519, roopangkumar.patel@ti.com wrote:
> From: Roopang Patel <roopangkumar.patel@ti.com>
> 
> Changes:
> 1) Given support of v4l2 extra controls such as
> bitrate,gopsize and iperiod for H264 encoding and
> also added as v4l2 H264 plugin properties to set and
> get for dynamic value change.
> 
> 2) We need to set these extra controls before the gstreamer
> pipeline set format API invoke.so, we are setting extra
> controls when the pipeline change the state
> GST_STATE_CHANGE_READY_TO_PAUSED.

I'd suggest you might want to study how to write a proper commit message
https://www.kernel.org/doc/html/v4.10/process/submitting-patches.html#describe-your-changes

is a good reference, so is a bunch of internet articles..

> ---
>  sys/v4l2/gstv4l2h264enc.c | 135 +++++++++++++++++++++++++++++++++++++-
>  sys/v4l2/gstv4l2h264enc.h |   9 +++
>  2 files changed, 142 insertions(+), 2 deletions(-)

	Ummm.... -ECONFUSED.

How does this patch apply to [1]

[1] http://arago-project.org/git/?p=meta-arago.git;a=tree
> 
> diff --git a/sys/v4l2/gstv4l2h264enc.c b/sys/v4l2/gstv4l2h264enc.c
> index ee160b3a0..169e6ae69 100644
> --- a/sys/v4l2/gstv4l2h264enc.c
> +++ b/sys/v4l2/gstv4l2h264enc.c
> @@ -47,6 +47,9 @@ enum
>  {
>    PROP_0,
>    V4L2_STD_OBJECT_PROPS,
> +  PROP_BITRATE,
> +  PROP_GOPSIZE,
> +  PROP_I_PERIOD,
>  /* TODO add H264 controls
>   * PROP_I_FRAME_QP,
>   * PROP_P_FRAME_QP,
> @@ -78,14 +81,46 @@ static void
>  gst_v4l2_h264_enc_set_property (GObject * object,
>      guint prop_id, const GValue * value, GParamSpec * pspec)
>  {
> -  /* TODO */
> +  GstV4l2H264Enc *self = GST_V4L2_H264_ENC (object);
> +
> +  switch(prop_id)
> +  {
> +    case PROP_BITRATE:{
> +     self->bitrate = g_value_get_uint (value);
> +    }break;
> +    case PROP_GOPSIZE:{
> +     self->gopsize = g_value_get_uint (value);
> +    }break;
> +    case PROP_I_PERIOD:{
> +     self->iperiod = g_value_get_uint (value);
> +    }break;
> +    default:{
> +     G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
> +    }break;
> +  }

If this is a kernel patch, please don't post it in public kernel list
with ti.com ID - this is wrong in so many kernel coding style ways.


[...]

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

