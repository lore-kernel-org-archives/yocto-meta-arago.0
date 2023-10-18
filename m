Return-Path: <p-mantena@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22734CDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 07:49:55 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.276347.1697615391762858944
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 18 Oct 2023 00:49:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=VfH3m95l;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: p-mantena@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39I7npZc077256
	for <meta-arago@lists.yoctoproject.org>; Wed, 18 Oct 2023 02:49:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697615391;
	bh=JvVzlKSQ2oSxYbgLIkCJovzXEfPrKbx4lxxQRX3W3qU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=VfH3m95lN56OEOinfdZBCzWKvfNocHbtsKWsN3VXdepLjcP/1l7bvG2iQaYs84ZDe
	 76PZ7dIt/RjyO+D5tbg9Df1t8mJxrx3Qw2gvyekJghC1O2YPBDCECp4wyJCFn8hhVk
	 hqAc+53AjdIcbk036fpbzJ0rrsXZ+pWy6VuPpIbg=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39I7npfA101049
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 18 Oct 2023 02:49:51 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 18
 Oct 2023 02:49:50 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 18 Oct 2023 02:49:50 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39I7nopU001525;
	Wed, 18 Oct 2023 02:49:50 -0500
Date: Wed, 18 Oct 2023 13:19:49 +0530
From: Prasanth Mantena <p-mantena@ti.com>
To: Devarsh Thakkar <devarsht@ti.com>
CC: Rahul T R <r-ravikumar@ti.com>, <meta-arago@lists.yoctoproject.org>,
        Ryan
 Eatmon <reatmon@ti.com>, <denys@ti.com>
Subject: Re: [meta-arago][master/kirkstone][PATCH] gstreamer1.0-plugins-good:
 wave5-codec: Set max buffers same as min buffers
Message-ID: <20231018074948.cnyklhnuuluabrbx@uda0496754>
References: <20231017115119.306574-1-r-ravikumar@ti.com>
 <28e54a94-ce33-4dd3-ec49-9e8c8db01486@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <28e54a94-ce33-4dd3-ec49-9e8c8db01486@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 18 Oct 2023 07:49:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14947

On 13:08-20231018, Devarsh Thakkar wrote:
> Hi Rahul,
> 
> On 17/10/23 17:21, Rahul T R wrote:
> > wave5 codec driver can not work with new buffers allocated post stream
> 
> I am not aware of such bug in wave5 driver also iiuc it's actually not a wave5
> driver problem but probably related to v4l2 plugin not able to provide the
> buffer with same index always to the driver for which the workaround patch
> 0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch was made to maintain 1-to-1
> between v4l2 buffer indices and buffer.
> 
> I assume the problem related to the workaround not able to handle 1-to-1 for
> dynamically allocated buffers post streaming right(if required you can
> probably check with Prasanth if it would be possible to support this), if
> that's the case then I would suggest to update commit message likewise.
> 
> > start. To avoid issues because of this set max_buffers same as min
> > buffers, so that new buffers are not allocated post stream start
> > 
> > Signed-off-by: Rahul T R <r-ravikumar@ti.com>
> 
> With the suggested changes in commit message,
> 
> Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
Agreed. This is not really a bug in driver. It is on the plugin side,
where the mapping of buffers with v4l2 indices is not being maintained.
Please modify the commit message.

With this suggestion,

Reviewed-by: Prasanth Babu Mantena <p-mantena@ti.com>
> 
> Regards
> Devarsh
> > ---
> >  .../0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch      | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> > 
> > diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch
> > index a1471661..bf73e257 100644
> > --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch
> > +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Changes-for-DMA-Buf-import-j721s2.patch
> > @@ -14,9 +14,9 @@ Signed-off-by: Prasanth Babu Mantena <p-mantena@ti.com>
> >  ---
> >   sys/v4l2/gstv4l2bufferpool.c | 17 ++++++++++++++---
> >   sys/v4l2/gstv4l2bufferpool.h |  2 ++
> > - sys/v4l2/gstv4l2object.c     | 15 ++++++++++++---
> > + sys/v4l2/gstv4l2object.c     | 16 +++++++++++++---
> >   sys/v4l2/gstv4l2videodec.c   | 20 ++++++++++++++------
> > - 4 files changed, 42 insertions(+), 12 deletions(-)
> > + 4 files changed, 43 insertions(+), 12 deletions(-)
> >  
> >  diff --git a/sys/v4l2/gstv4l2bufferpool.c b/sys/v4l2/gstv4l2bufferpool.c
> >  index d85f036..e6a60dc 100644
> > @@ -86,7 +86,7 @@ index ee60540..eff1cf2 100644
> >       own_min = MAX (own_min, GST_V4L2_MIN_BUFFERS (obj));
> >  
> >       /* for the downstream pool, we keep what downstream wants, though ensure
> > -@@ -5049,8 +5053,13 @@ gst_v4l2_object_decide_allocation (GstV4l2Object * obj, GstQuery * query)
> > +@@ -5049,8 +5053,14 @@ gst_v4l2_object_decide_allocation (GstV4l2Object * obj, GstQuery * query)
> >       min = MAX (min, GST_V4L2_MIN_BUFFERS (obj));
> >  
> >       /* To import we need the other pool to hold at least own_min */
> > @@ -95,6 +95,7 @@ index ee60540..eff1cf2 100644
> >  +    if (obj_pool == pool) {
> >  +        if (0 == strcmp(obj->vcap.driver, "wave5-dec")) {
> >  +            min = own_min;
> > ++            max = min;
> >  +        } else {
> >  +            min += own_min;
> >  +        }

