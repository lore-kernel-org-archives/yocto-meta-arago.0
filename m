Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 4EE15529C7
	for <meta-arago@arago-project.org>;
	Fri, 20 May 2016 20:16:29 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u4KKGTaJ032192
	for <meta-arago@arago-project.org>; Fri, 20 May 2016 15:16:29 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4KKGSnK015109
	for <meta-arago@arago-project.org>; Fri, 20 May 2016 15:16:29 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 20 May 2016 15:16:28 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4KKGS9Q010893;
	Fri, 20 May 2016 15:16:28 -0500
Date: Fri, 20 May 2016 16:16:12 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20160520201612.GG3287@edge>
References: <1463749265-16509-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
In-Reply-To: <1463749265-16509-1-git-send-email-a0393906@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] libav: Remove deprecated recipe
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
X-List-Received-Date: Fri, 20 May 2016 20:16:29 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Yeah, I'm aware of it, but not yet ready to remove it - need to double/triple 
check that ffmpeg matches the configuration...

-- 
Denys


On Fri, May 20, 2016 at 06:31:05PM +0530, Karthik Ramanan wrote:
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  .../recipes-multimedia/libav/libav_9.16.bbappend   | 40 ----------------------
>  1 file changed, 40 deletions(-)
>  delete mode 100644 meta-arago-distro/recipes-multimedia/libav/libav_9.16.bbappend
> 
> diff --git a/meta-arago-distro/recipes-multimedia/libav/libav_9.16.bbappend b/meta-arago-distro/recipes-multimedia/libav/libav_9.16.bbappend
> deleted file mode 100644
> index dc8977a..0000000
> --- a/meta-arago-distro/recipes-multimedia/libav/libav_9.16.bbappend
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -PR_append = ".arago0"
> -
> -PACKAGECONFIG := "${@oe_filter_out('x264','${PACKAGECONFIG}', d)}"
> -LICENSE_FLAGS = ""
> -
> -# Disable features that have potential commercial licensing restrictions
> -EXTRA_OECONF += "\
> -    --disable-encoder=libmp3lame \
> -    --disable-decoder=mp3 \
> -    --disable-decoder=mp3adu \
> -    --disable-decoder=mp3adufloat \
> -    --disable-decoder=mp3float \
> -    --disable-decoder=mp3on4 \
> -    --disable-decoder=mp3on4float \
> -    --disable-muxer=mp3 \
> -    --disable-demuxer=mp3 \
> -    --disable-bsf=mp3_header_decompress \
> -    --disable-bsf=mp3_header_compress   \
> -                                 \
> -    --disable-encoder=mpeg2video \
> -    --disable-decoder=mpeg2video \
> -    --disable-hwaccel=mpeg2_vaapi \
> -    --disable-hwaccel=mpeg2_dxva2 \
> -    --disable-muxer=mpeg2dvd \
> -    --disable-muxer=mpeg2svcd \
> -    --disable-muxer=mpeg2video \
> -    --disable-muxer=mpeg2vob \
> -                            \
> -    --disable-encoder=ac3_fixed \
> -    --disable-encoder=ac3 \
> -    --disable-decoder=ac3 \
> -    --disable-decoder=eac3 \
> -    --disable-demuxer=ac3 \
> -    --disable-demuxer=eac3 \
> -    --disable-demuxer=dts \
> -    --disable-muxer=ac3 \
> -    --disable-muxer=eac3 \
> -    --disable-muxer=dts \
> -    --disable-parser=ac3 \
> -"
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

