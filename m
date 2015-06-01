Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id DD182529B8
	for <meta-arago@arago-project.org>;
	Mon,  1 Jun 2015 15:41:05 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t51Ff4DQ003854;
	Mon, 1 Jun 2015 10:41:04 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t51Ff3O9024178;
	Mon, 1 Jun 2015 10:41:03 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 1 Jun 2015 10:41:03 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t51Ff30C031836;
	Mon, 1 Jun 2015 10:41:03 -0500
Date: Mon, 1 Jun 2015 11:41:02 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: matti kaasinen <matti.kaasinen@gmail.com>
Message-ID: <20150601154102.GM16418@edge>
References: <CADnUhn30yG8MMjbonRKZqcpZJaqv6y8LzVXutj__2+Ns2nBq+w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADnUhn30yG8MMjbonRKZqcpZJaqv6y8LzVXutj__2+Ns2nBq+w@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: install/bitbake error
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
X-List-Received-Date: Mon, 01 Jun 2015 15:41:06 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, May 29, 2015 at 10:40:02AM +0300, matti kaasinen wrote:
> I tried to install Arago distribution following
> http://arago-project.org/wiki/index.php/Setting_Up_Build_Environment
> 
> I downloaded arago-2011.09-armv7a-linux-gnueabi-sdk.tar.bz2 and inserted
> arago-2011.09/armv7a/bin to my PATH
> 
> After some nasty error messages I inserted also TOOLCHAIN_BRAND=arago
> definition.
> BTW, why that is not mentioned in wiki, nor inserted in local.conf?

It defaults to external Linaro toolchain for armv7a and the old Arago 
toolchain for armv5te. If you want to override that, you must specify 
TOOLCHAIN_BRAND like you do above to use the old Arago toolchain for armv7a.


> Still after that I can't run:
> bitbake core-image-minimal
> successfully. I have set MAHINE=am335x-evm
> 
> OSError: [Errno 13] Permission denied: '/ARAGO-external-arago-toolchain'
> 
> Is this something to do with the fact that I chose to run?:
> 
> ./oe-layertool-setup.sh -f configs/arago-fido-config.txt
> 
> This '/ARAGO-external-arago-toolchain' path seems pretty strange.

The path does seem weird - are you sure you didn't specify it somewhere in the 
config? Did you add your toolchain location to the PATH?


> Does anyone have any clue what I have done wrong?
> 
> -Matti

> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


