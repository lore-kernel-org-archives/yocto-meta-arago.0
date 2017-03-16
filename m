Return-Path: <e-ruei1@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id DEF56529D2
	for <meta-arago@arago-project.org>;
	Thu, 16 Mar 2017 18:21:25 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2GILPWi032332
	for <meta-arago@arago-project.org>; Thu, 16 Mar 2017 13:21:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489688485;
	bh=6EDOKatTIYM+FUU6yPMsWvXikBrzIjhhGW2E3GseVE4=;
	h=Subject:To:References:CC:From:Date:In-Reply-To;
	b=snxEDjLSivjZQMcEc+4FcXatEZGmIcM+c5j+rMdM8i7FBgJd4zLPQ418emrmItYEI
	uV+HW/dJXCU7FwETPUWArMKQdbJwvGyyvcFJg0dGMADV45RqCBLtCreBcIjAjbJeE/
	u7nlEWCfaOwvGi0AT2E2AqzGD6NrzaVglagWrwuc=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2GILO37032751
	for <meta-arago@arago-project.org>; Thu, 16 Mar 2017 13:21:25 -0500
Received: from [158.218.103.39] (158.218.103.39) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 16 Mar 2017 13:21:24 -0500
To: Denys Dmytriyenko <denys@ti.com>, Eric Ruei <e-ruei1@ti.com>
References: <1489685377-53666-1-git-send-email-e-ruei1@ti.com>
	<1489685377-53666-2-git-send-email-e-ruei1@ti.com>
	<20170316180406.GK14484@edge>
From: "Ruei, Eric" <a0850410@ti.com>
Message-ID: <f509feb9-1f5e-56e5-3837-07708cf2b4f4@ti.com>
Date: Thu, 16 Mar 2017 14:21:24 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20170316180406.GK14484@edge>
X-Originating-IP: [158.218.103.39]
Cc: meta-arago@arago-project.org
Subject: Re: [krogoth][PATCH 2/3] gstreamer1.0-plugins-bad: kmssink: add YUYV support
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
X-List-Received-Date: Thu, 16 Mar 2017 18:21:26 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 3/16/2017 2:04 PM, Denys Dmytriyenko wrote:
> On Thu, Mar 16, 2017 at 01:29:36PM -0400, Eric Ruei wrote:
>> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
>> ---
>>  .../0002-kmssink-add-YUYV-support.patch            | 81 ++++++++++++++++++++++
>>  .../gstreamer1.0-plugins-bad_1.6.3.bbappend        |  2 +
>>  2 files changed, 83 insertions(+)
>>  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-kmssink-add-YUYV-support.patch
>>
>> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-kmssink-add-YUYV-support.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-kmssink-add-YUYV-support.patch
>> new file mode 100644
>> index 0000000..a5791cc
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-kmssink-add-YUYV-support.patch
>> @@ -0,0 +1,81 @@
>> +From af348c890c04ce9626d411055aae0974f410219f Mon Sep 17 00:00:00 2001
>> +From: Eric Ruei <e-ruei1@ti.com>
>> +Date: Tue, 14 Mar 2017 17:24:07 -0400
>> +Subject: [PATCH 2/2] kmssink: add YUYV support
>> +
>> +Signed-off-by: Eric Ruei <e-ruei1@ti.com>
>> +---
>> + sys/kms/gstkmsbufferpriv.c | 32 +++++++++++++++++++++++++++-----
>> + sys/kms/gstkmssink.c       |  2 +-
>> + 2 files changed, 28 insertions(+), 6 deletions(-)
>> +
>> +diff --git a/sys/kms/gstkmsbufferpriv.c b/sys/kms/gstkmsbufferpriv.c
>> +index 172a4c3..57c01f8 100644
>> +--- a/sys/kms/gstkmsbufferpriv.c
>> ++++ b/sys/kms/gstkmsbufferpriv.c
>> +@@ -41,22 +41,44 @@
>> + static int
>> + create_fb (GstKMSBufferPriv * priv, GstKMSSink * sink)
>> + {
>> ++
>> +   /* TODO get format, etc from caps.. and query device for
>> +    * supported formats, and make this all more flexible to
>> +    * cope with various formats:
>> +    */
>> +-  uint32_t fourcc = GST_MAKE_FOURCC ('N', 'V', '1', '2');
>> +-
>> ++  GstVideoFormat format = sink->format;
>> ++  uint32_t fourcc;
>> +   uint32_t handles[4] = {
>> +-    omap_bo_handle (priv->bo), omap_bo_handle (priv->bo),
>> ++    omap_bo_handle (priv->bo),
>> +   };
>> +   uint32_t pitches[4] = {
>> +-    GST_ROUND_UP_4 (sink->input_width), GST_ROUND_UP_4 (sink->input_width),
>> ++    GST_ROUND_UP_4 (sink->input_width),
>> +   };
>> +   uint32_t offsets[4] = {
>> +-    0, pitches[0] * sink->input_height
>> ++    0,
>> +   };
>> +
>> ++  /**
>> ++   * Only two formats are supported:
>> ++   * AM3/4: YUYV
>> ++   * AM5: NV12, YUYV
>> ++   */
>> ++  if(format == GST_VIDEO_FORMAT_YUY2)
>> ++  {
>> ++    /* YUYV */
>> ++    fourcc = GST_MAKE_FOURCC ('Y', 'U', 'Y', 'V');
>> ++    pitches[0] = GST_ROUND_UP_4 (sink->input_width*2);
>> ++  }
>> ++  else
>> ++  {
>> ++    /* NV12 */
>> ++    fourcc = GST_MAKE_FOURCC ('N', 'V', '1', '2');
>> ++    handles[1] = omap_bo_handle (priv->bo);
>> ++    pitches[1] = GST_ROUND_UP_4 (sink->input_width);
>> ++    offsets[1] = pitches[0] * sink->input_height;
>> ++  }
>> ++
>> ++
>> +   return drmModeAddFB2 (priv->fd, sink->input_width, sink->input_height,
>> +       fourcc, handles, pitches, offsets, &priv->fb_id, 0);
>> + }
>> +diff --git a/sys/kms/gstkmssink.c b/sys/kms/gstkmssink.c
>> +index 9795bdf..b36d88f 100644
>> +--- a/sys/kms/gstkmssink.c
>> ++++ b/sys/kms/gstkmssink.c
>> +@@ -50,7 +50,7 @@ static GstStaticPadTemplate gst_kms_sink_template_factory =
>> + GST_STATIC_PAD_TEMPLATE ("sink",
>> +     GST_PAD_SINK,
>> +     GST_PAD_ALWAYS,
>> +-    GST_STATIC_CAPS (GST_VIDEO_CAPS_MAKE("NV12"))
>> ++    GST_STATIC_CAPS (GST_VIDEO_CAPS_MAKE("{NV12,YUY2}"))
>
> YUY2 or YUYV?
>
YUY2 is the same as YUYV
YUV2 is used by Gstreamer.


>> +     );
>> +
>> + enum
>> +--
>> +1.9.1
>> +
>> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
>> index 2c903d4..317b19e 100644
>> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
>> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend
>> @@ -21,10 +21,12 @@ DEPENDS_append_ti33x = " \
>>
>>  SRC_URI_append_omap-a15 = " \
>>      file://0001-kmssink-remove-DCE-dependencies.patch \
>> +    file://0002-kmssink-add-YUYV-support.patch \
>>  "
>>
>>  SRC_URI_append_ti43x = " \
>>      file://0001-kmssink-remove-DCE-dependencies.patch \
>> +    file://0002-kmssink-add-YUYV-support.patch \
>>  "
>>
>>  SRC_URI_append_ti33x = " \
>> --
>> 1.9.1
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


