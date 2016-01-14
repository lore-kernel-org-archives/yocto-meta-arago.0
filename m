Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id C1FD35203A
	for <meta-arago@arago-project.org>;
	Thu, 14 Jan 2016 15:17:53 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0EFHrhG006502;
	Thu, 14 Jan 2016 09:17:53 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0EFHrL3019498;
	Thu, 14 Jan 2016 09:17:53 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 14 Jan 2016 09:17:53 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0EFHq63029440;
	Thu, 14 Jan 2016 09:17:52 -0600
Date: Thu, 14 Jan 2016 10:17:36 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Message-ID: <20160114151736.GC27464@edge>
References: <CADySD0HZ00Y+-6mrrvnetpEBJo44YgRJCHx1RQ7GVC51_ePSbw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADySD0HZ00Y+-6mrrvnetpEBJo44YgRJCHx1RQ7GVC51_ePSbw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: tisdk-rootfs-image error on fido branch
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
X-List-Received-Date: Thu, 14 Jan 2016 15:17:54 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Are you building from scratch or are you re-using tmp/work from a previous 
build?

-- 
Denys


On Fri, Jan 15, 2016 at 12:40:29AM +1300, Ankur Tyagi wrote:
> Hi,
> 
> I am using arago-fido-config to build tisdk image and it fails with this
> error:
> 
> Collected errors:
>  * satisfy_dependencies_for: Cannot satisfy the following dependencies for
> packagegroup-arago-test:
>  *     liblzma5 (>= 5.2.0) *
>  * opkg_install_cmd: Cannot install package packagegroup-arago-test.
> 
> Complete log @ http://pastebin.com/rVwYEEc0
> 
> thanks

> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


