Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 2CDC4530B7
	for <meta-arago@arago-project.org>;
	Wed,  6 Oct 2021 23:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6307740C1E;
	Wed,  6 Oct 2021 23:16:21 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id dkQz8L9CHzk8; Wed,  6 Oct 2021 23:16:21 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4757340031;
	Wed,  6 Oct 2021 23:16:20 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 88E5717467A; Wed,  6 Oct 2021 19:16:19 -0400 (EDT)
Date: Wed, 6 Oct 2021 19:16:19 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: daniel.lehne@amk-drives.bg
Message-ID: <20211006231619.GM1528@denix.org>
References: <009401d7b447$0e119530$2a34bf90$@amk-drives.bg>
MIME-Version: 1.0
In-Reply-To: <009401d7b447$0e119530$2a34bf90$@amk-drives.bg>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: Patch external-arm-toolchain on meta-arago-extras fails with gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf
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
X-List-Received-Date: Wed, 06 Oct 2021 23:15:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 28, 2021 at 11:58:48AM +0300, daniel.lehne@amk-drives.bg wrote:
> Hello, 
> 
> first, thanks for your great support on meta-arago layer and further
> enthusiastic developing.
> 
> I'm trying to build a project with an external toolchain but failing on the
> recipe
> /meta-arm/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/externa
> l-arm-toolchain.bb:do_install. I'm building in a docker container, with
> reduced layers using the ./oe-layertool-setup.sh command with following test
> config file. I've tried first
> gcc-arm-10.3-2021.07-x86_64-arm-none-linux-gnueabihf but it fails also, so I
> downgraded to gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf without
> success.

Hi, Daniel,

In order to post to the list you need to subscribe first. Otherwise your 
messages are held in moderation queue along with other spam posts and have 
very low chance to be seen.

It appears your layer configuration is not exactly correct. Arago Project uses 
oe-layersetup tool along with config files to setup layers:
http://arago-project.org/git/projects/?p=oe-layersetup.git;a=summary

If you need to use prebuilt Arm external toolchain with meta-arago/dunfell, 
then you should use 9.2-2019.12 version, according to this table:
http://arago-project.org/wiki/index.php/Setting_Up_Build_Environment#Available_Layer_Configurations

Also, you need to pin meta-arm/meta-arm-toolchain layer to commit 
c4f04f3fb66f8f4365b08b553af8206372e90a63, per the layer config:
http://arago-project.org/git/projects/?p=oe-layersetup.git;a=blob;f=configs/arago-dunfell-config.txt;hb=HEAD

That is due to some later changes in meta-arm-toolchain backported from master 
that broke meta-arago. This hasn't been resolved yet.

Alternatively, instead of using prebuilt Arm toolchain, you can build and use 
the internal toolchain, by setting or passing TOOLCHAIN_TYPE="internal"

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

