Return-Path: <e-ruei1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 53F3052974
	for <meta-arago@arago-project.org>;
	Mon, 25 Feb 2019 15:17:21 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x1PFHHBa097277
	for <meta-arago@arago-project.org>; Mon, 25 Feb 2019 09:17:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1551107837;
	bh=0N0O6NLnrOmmQlgUZLIWZPkC8JF01AEh4Z+kgscowLc=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=pxzh20LSRXiVx5xIOs1f3SboGloy69opH0dq6pv2DvfFRFVLCbaTk9z8J+S3yf8N5
	uhTmsqjgmsQb527CaeiEaSQYBwz8a2HwhXELBSlzNlV0E8xKaLjBLLUjk+CNa1Z9fG
	WGziu3cfyufyWnulB/Sy2H0NzaS5Qbh1XlN0U1lw=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x1PFHHd1035461
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 25 Feb 2019 09:17:17 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 25 Feb 2019 09:17:17 -0600
Received: from DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455]) by
	DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455%17]) with mapi id
	15.01.1591.008; Mon, 25 Feb 2019 09:17:17 -0600
From: "Ruei, Eric" <e-ruei1@ti.com>
To: "Gou, Hongmei" <h-gou@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [matrix-gui-v2-apps][PATCH]
	arm_multimedia: add kmssink support
Thread-Index: AQHUyTLG/19fSV/rW0ig4UanS6Pxx6XwpYgggAACVaA=
Date: Mon, 25 Feb 2019 15:17:16 +0000
Message-ID: <70b40251889b4e2f87c281820f393b0f@ti.com>
References: <1550677287-61590-1-git-send-email-e-ruei1@ti.com>
	<07520f85f77445af8f5ceb93a9048814@ti.com>
In-Reply-To: <07520f85f77445af8f5ceb93a9048814@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.148]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [matrix-gui-v2-apps][PATCH] arm_multimedia: add kmssink support
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
X-List-Received-Date: Mon, 25 Feb 2019 15:17:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Any suggest of better variable name?

Best regards,

Eric


-----Original Message-----
From: Gou, Hongmei=20
Sent: Monday, February 25, 2019 10:13 AM
To: Ruei, Eric; meta-arago@arago-project.org
Subject: RE: [EXTERNAL] [meta-arago] [matrix-gui-v2-apps][PATCH] arm_multim=
edia: add kmssink support

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Ruei, Eric
> Sent: Wednesday, February 20, 2019 10:41 AM
> To: meta-arago@arago-project.org
> Subject: [EXTERNAL] [meta-arago] [matrix-gui-v2-apps][PATCH]
> arm_multimedia: add kmssink support
>=20
> - use kmssink as video sink for AM4 and AM6 SoCs
> - cleanup indentations
>=20
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  .../arm_multimedia_h264dec/runH264Dec.sh           | 15 ++++++-
>  .../arm_multimedia_mpeg4aacdec/runMpeg4AacDec.sh   | 52
> +++++++++++++---------
>  .../arm_multimedia_mpeg4dec/runMpeg4Dec.sh         | 13 +++++-
>  3 files changed, 55 insertions(+), 25 deletions(-)
>=20
> diff --git a/multimedia_apps/arm_multimedia_h264dec/runH264Dec.sh
> b/multimedia_apps/arm_multimedia_h264dec/runH264Dec.sh
> index f1ea7dd..9a3b47b 100644
> --- a/multimedia_apps/arm_multimedia_h264dec/runH264Dec.sh
> +++ b/multimedia_apps/arm_multimedia_h264dec/runH264Dec.sh
> @@ -1,7 +1,9 @@
>  #!/bin/sh
>=20
>  machine_type=3D"`cat /etc/hostname`"
> +VIDEO_SINK=3D"kmssink"
>  if [ "$machine_type" =3D "am335x-evm" ] || [ "$machine_type" =3D "am335x=
-hs-
> evm" ]; then
> +        VIDEO_SINK=3D"fbdevsink"
>  	resolution=3D"`fbset | awk '/geometry/ {print $2"x"$3}'`"
>  	if [ "$resolution" =3D "480x272" ]; then
>  		filename=3D"/usr/share/ti/video/TearOfSteel-Short-
> 400x240.264"
> @@ -25,7 +27,8 @@ then
>          fi
>  elif [ "$machine_type" =3D "am65xx-evm" ]
>  then
> -     filename=3D"/usr/share/ti/video/TearOfSteel-Short-1280x540.h264"
> +     VIDEO_SINK=3D"kmssink_am6"

Setting VIDEO_SINK  as kmssink_am6 may cause confusion. According to the pi=
pelines used below,
am6 is using kmssink also, but requires a different video format for the di=
splay.

> +     filename=3D"/usr/share/ti/video/TearOfSteel-Short-720x406.264"
>  else
>  	default_display=3D"`cat
> /sys/devices/platform/omapdss/manager0/display`"
>  	if [ "$default_display" =3D "dvi" ]; then
> @@ -50,4 +53,12 @@ echo ""
>  echo "Launch GStreamer pipeline"
>  echo ""
>  echo "Length of video clip: 21 seconds"
> -gst-launch-1.0 filesrc location=3D$filename ! queue ! h264parse ! avdec_=
h264 !
> videoconvert ! fbdevsink device=3D/dev/fb0
> +if [ "$VIDEO_SINK" =3D "fbdevsink" ]
> +then
> +	gst-launch-1.0 filesrc location=3D$filename ! queue ! h264parse !
> avdec_h264 ! videoconvert ! fbdevsink device=3D/dev/fb0
> +elif [ "$VIDEO_SINK" =3D "kmssink_am6" ]
> +then
> +	gst-launch-1.0 filesrc location=3D$filename ! queue ! h264parse !
> avdec_h264 ! videoconvert ! 'video/x-raw, format=3D(string)BGRA' ! kmssin=
k
> +else
> +	gst-launch-1.0 filesrc location=3D$filename ! queue ! h264parse !
> avdec_h264 ! videoconvert ! kmssink
> +fi
> \ No newline at end of file
> diff --git
> a/multimedia_apps/arm_multimedia_mpeg4aacdec/runMpeg4AacDec.sh
> b/multimedia_apps/arm_multimedia_mpeg4aacdec/runMpeg4AacDec.sh
> index 18ee0ea..d968435 100644
> --- a/multimedia_apps/arm_multimedia_mpeg4aacdec/runMpeg4AacDec.sh
> +++
> b/multimedia_apps/arm_multimedia_mpeg4aacdec/runMpeg4AacDec.sh
> @@ -8,28 +8,34 @@ elif grep -q "no soundcards" /proc/asound/cards; then
>          echo "No sound devices found!"
>  else
>  	machine_type=3D"`cat /etc/hostname`"
> +	VIDEO_SINK=3D"kmssink"
>  	if [ "$machine_type" =3D "am335x-evm" ] || [ "$machine_type" =3D
> "am335x-hs-evm" ]; then
> +		VIDEO_SINK=3D"fbdevsink"
>  		resolution=3D"`fbset | awk '/geometry/ {print $2"x"$3}'`"
> -		 if [ "$resolution" =3D "480x272" ]; then
> +		if [ "$resolution" =3D "480x272" ]; then
>  			filename=3D"/usr/share/ti/video/TearOfSteel-AV-
> Short-400x240.mp4"
>  		else
>  			# Use WVGA for all other resolutions
>  			filename=3D"/usr/share/ti/video/TearOfSteel-AV-
> Short-720x420.mp4"
> -	fi
> -    elif [ "$machine_type" =3D "dra7xx-evm" ]
> -    then
> -	    filename=3D"/usr/share/ti/video/TearOfSteel-AV-Short-
> 720x420.mp4"
> -    elif [ "$machine_type" =3D "omap5-evm" ]
> -    then
> -        filename=3D"/usr/share/ti/video/TearOfSteel-AV-Short-720x406.mp4=
"
> -    elif [ "$machine_type" =3D "am437x-evm" ] || [ "$machine_type" =3D
> "am437x-hs-evm" ] || [ "$machine_type" =3D "am438x-epos-evm" ]|| [
> "$machine_type" =3D "am65xx-evm" ]
> -    then
> -            resolution=3D"`fbset | awk '/geometry/ {print $2"x"$3}'`"
> -            if [ "$resolution" =3D "480x272" ]; then
> -                filename=3D"/usr/share/ti/video/TearOfSteel-AV-Short-
> 400x240.mp4"
> -            else
> -                filename=3D"/usr/share/ti/video/TearOfSteel-AV-Short-
> 720x406.mp4"
> -            fi
> +		fi
> +	elif [ "$machine_type" =3D "dra7xx-evm" ]
> +	then
> +		filename=3D"/usr/share/ti/video/TearOfSteel-AV-Short-
> 720x420.mp4"
> +	elif [ "$machine_type" =3D "omap5-evm" ]
> +	then
> +		filename=3D"/usr/share/ti/video/TearOfSteel-AV-Short-
> 720x406.mp4"
> +	elif [ "$machine_type" =3D "am65xx-evm" ]
> +	then
> +		VIDEO_SINK=3D"kmssink_am6"
> +		filename=3D"/usr/share/ti/video/TearOfSteel-AV-Short-
> 720x406.mp4"
> +	elif [ "$machine_type" =3D "am437x-evm" ] || [ "$machine_type" =3D
> "am437x-hs-evm" ] || [ "$machine_type" =3D "am438x-epos-evm" ]
> +	then
> +		resolution=3D"`fbset | awk '/geometry/ {print $2"x"$3}'`"
> +		if [ "$resolution" =3D "480x272" ]; then
> +			filename=3D"/usr/share/ti/video/TearOfSteel-AV-
> Short-400x240.mp4"
> +		else
> +			filename=3D"/usr/share/ti/video/TearOfSteel-AV-
> Short-720x406.mp4"
> +		fi
>  	else
>  		default_display=3D"`cat
> /sys/devices/platform/omapdss/manager0/display`"
>  		if [ "$default_display" =3D "dvi" ]; then
> @@ -52,14 +58,12 @@ else
>  		amixer -c 0 set Headset 1+ unmute
>  	elif [ "$machine_type" =3D "am335x-evm" ] || [ "$machine_type" =3D
> "am335x-hs-evm" ]; then
>  		amixer cset name=3D'PCM Playback Volume' 127
> -    elif [ "$machine_type" =3D "omap5-evm" ]; then
> +	elif [ "$machine_type" =3D "omap5-evm" ]; then
>  		amixer cset name=3D'PCM Playback Volume' 127
> -    elif [ "$machine_type" =3D "am437x-evm" ] || [ "$machine_type" =3D
> "am437x-hs-evm" ] || [ "$machine_type" =3D "am438x-epos-evm" ]; then
> -
> +	elif [ "$machine_type" =3D "am437x-evm" ] || [ "$machine_type" =3D
> "am437x-hs-evm" ] || [ "$machine_type" =3D "am438x-epos-evm" ]; then
>  		# EPOS uses a different configuration so check if
>  		# we are running on that board
>  		model_name=3D`cat /proc/device-tree/model | grep -i epos`
> -
>  		if [ "$?" =3D '0' ]; then
>  			amixer cset name=3D'DAC Playback Volume' 127
>  			amixer cset name=3D'HP Analog Playback Volume' 66
> @@ -72,5 +76,11 @@ else
>  			amixer cset name=3D'PCM Playback Volume' 127
>  		fi
>  	fi
> -	gst-launch-1.0 filesrc location=3D$filename ! queue ! qtdemux
> name=3Ddemux demux.audio_0 ! queue ! faad ! alsasink demux.video_0 !
> queue ! avdec_mpeg4 ! videoconvert ! fbdevsink device=3D/dev/fb0
> +	if [ "$VIDEO_SINK" =3D "fbdevsink" ]; then
> +		gst-launch-1.0 filesrc location=3D$filename ! queue ! qtdemux
> name=3Ddemux demux.audio_0 ! queue ! faad ! alsasink demux.video_0 !
> queue ! avdec_mpeg4 ! videoconvert ! fbdevsink device=3D/dev/fb0
> +	elif [ "$VIDEO_SINK" =3D "kmssink_am6" ]; then
> +		gst-launch-1.0 filesrc location=3D$filename ! queue ! qtdemux
> name=3Ddemux demux.audio_0 ! queue ! faad ! alsasink demux.video_0 !
> queue ! avdec_mpeg4 ! videoconvert ! 'video/x-raw, format=3D(string)BGRA'=
 !
> kmssink
> +	else
> +		gst-launch-1.0 filesrc location=3D$filename ! queue ! qtdemux
> name=3Ddemux demux.audio_0 ! queue ! faad ! alsasink demux.video_0 !
> queue ! avdec_mpeg4 ! videoconvert ! kmssink
> +	fi
>  fi
> diff --git a/multimedia_apps/arm_multimedia_mpeg4dec/runMpeg4Dec.sh
> b/multimedia_apps/arm_multimedia_mpeg4dec/runMpeg4Dec.sh
> index 82fcb2c..bb565c2 100644
> --- a/multimedia_apps/arm_multimedia_mpeg4dec/runMpeg4Dec.sh
> +++ b/multimedia_apps/arm_multimedia_mpeg4dec/runMpeg4Dec.sh
> @@ -1,7 +1,9 @@
>  #!/bin/sh
>=20
>  machine_type=3D"`cat /etc/hostname`"
> +VIDEO_SINK=3D"kmssink"
>  if [ "$machine_type" =3D "am335x-evm" ] || [ "$machine_type" =3D "am335x=
-hs-
> evm" ]; then
> +        VIDEO_SINK=3D"fbdevsink"
>  	resolution=3D"`fbset | awk '/geometry/ {print $2"x"$3}'`"
>  	if [ "$resolution" =3D "480x272" ]; then
>  		filename=3D"/usr/share/ti/video/TearOfSteel-Short-
> 400x240.m4v"
> @@ -25,7 +27,8 @@ then
>      fi
>  elif [ "$machine_type" =3D "am65xx-evm" ]
>  then
> -     filename=3D"/usr/share/ti/video/TearOfSteel-Short-1280x540.m4v"
> +     VIDEO_SINK=3D"kmssink_am6"
> +     filename=3D"/usr/share/ti/video/TearOfSteel-Short-720x406.m4v"
>  else
>  	default_display=3D"`cat
> /sys/devices/platform/omapdss/manager0/display`"
>  	if [ "$default_display" =3D "dvi" ]; then
> @@ -46,4 +49,10 @@ if [ ! -f $filename ]; then
>          echo "Video clip not found"
>          exit 1
>  fi
> -gst-launch-1.0 playbin uri=3Dfile://$filename video-sink=3Dfbdevsink aud=
io-
> sink=3Dfakesink
> +if [ "$VIDEO_SINK" =3D "fbdevsink" ]; then
> +	gst-launch-1.0 playbin uri=3Dfile://$filename video-sink=3Dfbdevsink
> audio-sink=3Dfakesink
> +elif [ "$VIDEO_SINK" =3D "kmssink_am6" ]; then
> +	gst-launch-1.0 filesrc location=3D$filename ! queue ! qtdemux
> name=3Ddemux demux.video_0 ! queue ! avdec_mpeg4 ! videoconvert !
> 'video/x-raw, format=3D(string)BGRA' ! kmssink
> +else
> +	gst-launch-1.0 filesrc location=3D$filename ! queue ! qtdemux
> name=3Ddemux demux.video_0 ! queue ! avdec_mpeg4 ! videoconvert !
> kmssink
> +fi
> --
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

