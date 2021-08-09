Return-Path: <nikhil.nd@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 9BBC352A76
	for <meta-arago@arago-project.org>;
	Mon,  9 Aug 2021 18:17:15 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 179IHYsE025183;
	Mon, 9 Aug 2021 13:17:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1628533054;
	bh=VpGjypW3KhYko8JLAP0bgsJWI0rXVdbMGP6b4J566Es=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=fEv7UeLydB2tBGN4V+GEohVZ4nc3zofA7YgdUJG2IsxkwIez5VWIvH9qLusy31ot7
	912ELXRUP47Te+zlmcGhJ1KUETGwCZAf201Pi3rCAaUa/y9pQek/pPBm//exBvlwPL
	xVNtOot2FhGXy3V3dbH5t0+5hbNVmr9W0AFO66RU=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 179IHXhB015951
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 9 Aug 2021 13:17:33 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Mon, 9 Aug 2021 13:17:33 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Mon, 9 Aug 2021 13:17:33 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 179IHWUZ081861;
	Mon, 9 Aug 2021 13:17:33 -0500
Date: Mon, 9 Aug 2021 23:47:31 +0530
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: "Bajjuri, Praneeth" <praneeth@ti.com>
Message-ID: <20210809181731.c4wnpmmwz7n27b42@NiksLab>
References: <20210806114852.60704-1-priya.ns@ti.com>
	<37141086-c8fc-919a-8a7e-73e7edd96926@ti.com>
MIME-Version: 1.0
In-Reply-To: <37141086-c8fc-919a-8a7e-73e7edd96926@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Sekhar Nori <nsekhar@ti.com>, meta-arago@arago-project.org,
	Priya N S <priya.ns@ti.com>
Subject: Re: [oe-layersetup PATCH v2] processor-sdk: Add 07.03.00.005 release config
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
X-List-Received-Date: Mon, 09 Aug 2021 18:17:16 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 11:50-20210806, Bajjuri, Praneeth wrote:
> 
> 
> On 8/6/2021 6:48 AM, Priya N S wrote:
> > Signed-off-by: Priya N S <priya.ns@ti.com>
> > ---
> > 
> > Hi All,
> > Kindly ignore the changes made in the V1 patch and consider the
> > V2 patch.
> > 
> > Changes made in the V2 patch:
> > * Added the processor-sdk-07.03.00.005-config for the 07.03
> >    release.
> 
> Why are we doing this at the time of 8.0 release ? will there be a 8.0 based
> config too as a separate patch later?

We are making 8.0 release for the AM64 today.
I will submit config file for that soon.

> 
> Anyhow, this patch is a NACK. See review comments below.
> 
> 
> > * This corresponds to the 07.03 release for the am335x-evm
> >    and am437x-evm platforms.
> > 
> >   .../processor-sdk-07.03.00.005-config.txt       | 17 +++++++++++++++++
> >   1 file changed, 17 insertions(+)
> >   create mode 100644 configs/processor-sdk/processor-sdk-07.03.00.005-config.txt
> > 
> > diff --git a/configs/processor-sdk/processor-sdk-07.03.00.005-config.txt b/configs/processor-sdk/processor-sdk-07.03.00.005-config.txt
> > new file mode 100644
> > index 0000000..09bde9e
> > --- /dev/null
> > +++ b/configs/processor-sdk/processor-sdk-07.03.00.005-config.txt
> 
> Did the convention followed for processor-sdk change?
> Ex: I see 106* used for the last part of the release name (may be pointing
> to a build number)
> Ref: http://arago-project.org/git/projects/oe-layersetup.git?p=projects/oe-layersetup.git;a=commit;h=30111f3c58442c088969a548dcd6c9140c422da8
> 
> 
> > @@ -0,0 +1,17 @@
> > +# This file takes repo entries in the format
> > +# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
> > +
> > +bitbake,git://git.openembedded.org/bitbake,1.46,017a39ed05d065bf28fd38f91bcde8a098300551
> > +meta-processor-sdk,git://git.ti.com/processor-sdk/meta-processor-sdk.git,dunfell,c467012684e57c914c4070238987e931f329da15,layers=
> > 
> 
> Why commitsha and not a 07.03* tag ?
> 
> Nikhil, does this look correct?

This is correct. You won't find any tags in meta-processor-sdk
All the config files have a commit SHA only.

> 
> 
> +meta-arago,git://arago-project.org/git/meta-arago.git,dunfell,07.03.00.005,layers=meta-arago-distro:meta-arago-extras
> > +meta-aws,https://github.com/aws/meta-aws.git,dunfell,HEAD,layers=
> 
> HEAD >> This doesnt look right for the config snapshot. You need to pick the
> exact commitsha used for your release tagged images ( you should see that in
> build-config file)
> 

I agree with Praneeth here.
We have to make sure that the release config file can reproduce the
build. Using HEAD defeats the purpose. Please replace with commit SHA
or tag everywhere in release file.


Regards,
Nikhil D
> > +#meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
> > +meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,b4d24d70aca75791902df5cd59a4f4a54aa4a125,layers=
> > +meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,89abc62b47f6f20db9d00a8ec9b2c1b6b60ac3f9,layers=
> > +meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,389757a7494221fea1d8437e9a01c6e4fb4700af,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
> > +meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,07.03.00.005,layers=
> > +meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,dunfell,HEAD,layers=meta-optee
> 
> Similar comment as above of meta-aws. HEAD is not correct for release
> snapshot.
> By the way, why do you even need meta-linaro layer for psdkl builds?
> 
> 
> > +meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
> > +oe-core,git://git.openembedded.org/openembedded-core,dunfell,707036d4ec12ef1a260adcef78627b26e32e6540,layers=meta
> > +OECORELAYERCONF=./sample-files/bblayers.conf.sample
> > +OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
> > 

