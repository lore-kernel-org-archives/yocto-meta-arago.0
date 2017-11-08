Return-Path: <karthik.ramanan@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 09DD152A48
	for <meta-arago@arago-project.org>;
	Wed,  8 Nov 2017 09:36:41 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id vA89afmZ023920
	for <meta-arago@arago-project.org>; Wed, 8 Nov 2017 03:36:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1510133801;
	bh=0g+vi8hAn6+BRIpTD7DDJAjLd83qQdxJ737Vi5BOOUM=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=RRaUroPJTG53G2avuee7qedL9Rm8TzkIbg4Z5TTjejSwQ+YVa2R0DYK8rfTMha3Nk
	57fwcCQxvMOrTW++Uu+jdpek608WF52Ho2Vys0aB8YUbWYPG5UH5VPSKKDBv17q065
	CnraEAItuR04a3Xox7DCklYsZpX6oQmcuZIm9bYU=
Received: from dbdlxv05.itg.ti.com (dbdlxv05.itg.ti.com [172.24.171.60])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vA89aerE006634
	for <meta-arago@arago-project.org>; Wed, 8 Nov 2017 03:36:41 -0600
Received: from DBDE72.ent.ti.com (dbdmailx.itg.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id vA89acBi023327
	for <meta-arago@arago-project.org>; Wed, 8 Nov 2017 15:06:39 +0530
Received: from [10.87.38.24] (10.87.38.24) by DBDE72.ent.ti.com
	(172.24.171.97) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 8 Nov 2017 15:06:35 +0530
To: Ramprasad N <x0038811@ti.com>, <meta-arago@arago-project.org>
References: <1510112505-15937-1-git-send-email-x0038811@ti.com>
From: Karthik Ramanan <a0393906@ti.com>
Message-ID: <4913a363-0e3b-8a93-88e3-d7187a795a2f@ti.com>
Date: Wed, 8 Nov 2017 17:36:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1510112505-15937-1-git-send-email-x0038811@ti.com>
X-Originating-IP: [10.87.38.24]
Subject: Re: [morty PATCH] gstreamer1.0*-good: Increase v4l2src minimum buffers by 4
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
X-List-Received-Date: Wed, 08 Nov 2017 09:36:42 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Looks good. ACK.


On 08-Nov-17 11:41 AM, Ramprasad N wrote:
> Signed-off-by: Ramprasad N <x0038811@ti.com>
> ---
>   ...v4l2src-Increase-minimum-num-buffers-by-4.patch | 33 ++++++++++++++++++++++
>   .../gstreamer1.0-plugins-good_1.8.3.bbappend       |  8 ++++++
>   2 files changed, 41 insertions(+)
>   create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2src-Increase-minimum-num-buffers-by-4.patch
>   create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.8.3.bbappend
>
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2src-Increase-minimum-num-buffers-by-4.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2src-Increase-minimum-num-buffers-by-4.patch
> new file mode 100644
> index 0000000..1af90c1
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2src-Increase-minimum-num-buffers-by-4.patch
> @@ -0,0 +1,33 @@
> +From 73254df370fec6a2eb1ae6711955307a1d4bf173 Mon Sep 17 00:00:00 2001
> +From: Ramprasad N <x0038811@ti.com>
> +Date: Fri, 13 Oct 2017 15:48:06 +0530
> +Subject: [PATCH] v4l2src: Increase minimum num buffers by 4
> +
> +v4l2src plugin allocates 4 buffers for the pipeline.
> +To capture video in realtime the pipeline without frameloss,
> +four buffers are not sufficient. Increase the
> +number of buffers by 4 more.
> +
> +Signed-off-by: Ramprasad N <x0038811@ti.com>
> +---
> + sys/v4l2/gstv4l2object.c | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/sys/v4l2/gstv4l2object.c b/sys/v4l2/gstv4l2object.c
> +index 549e06f..773f46d 100644
> +--- a/sys/v4l2/gstv4l2object.c
> ++++ b/sys/v4l2/gstv4l2object.c
> +@@ -3939,7 +3939,9 @@ gst_v4l2_object_decide_allocation (GstV4l2Object * obj, GstQuery * query)
> +      * to fill the pipeline, the minimum required to decoder according to the
> +      * driver and 1 more, so we don't endup up with everything downstream or
> +      * held by the decoder. */
> +-    own_min = min + obj->min_buffers + 1;
> ++    /* Increase the number of buffers required by 4 more to capture video in
> ++     * realtime. With default number of 4 buffers, frame loss is observed */
> ++    own_min = min + obj->min_buffers + 5;
> +
> +     /* If no allocation parameters where provided, allow for a little more
> +      * buffers and enable copy threshold */
> +--
> +1.9.1
> +
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.8.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.8.3.bbappend
> new file mode 100644
> index 0000000..29a07b2
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.8.3.bbappend
> @@ -0,0 +1,8 @@
> +PR_append = ".arago0"
> +
> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> +
> +SRC_URI += " \
> +      file://0001-v4l2src-Increase-minimum-num-buffers-by-4.patch \
> +      "
> +


