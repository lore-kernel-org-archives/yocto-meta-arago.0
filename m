Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 2D2EE529CC
	for <meta-arago@arago-project.org>;
	Wed, 23 Oct 2013 18:51:53 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9NIpqYg004106
	for <meta-arago@arago-project.org>; Wed, 23 Oct 2013 13:51:52 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9NIpqol013508
	for <meta-arago@arago-project.org>; Wed, 23 Oct 2013 13:51:52 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Wed, 23 Oct 2013 13:51:52 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Rini, Tom" <trini@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 0/3] Update SD card auto-mounting
Thread-Index: AQHO0B1oYFTafkPV/Ue4sFoHQMJ7OJoCoY/g
Date: Wed, 23 Oct 2013 18:51:51 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101597D41B9@DLEE11.ent.ti.com>
References: <1382552778-29138-1-git-send-email-trini@ti.com>
In-Reply-To: <1382552778-29138-1-git-send-email-trini@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 0/3] Update SD card auto-mounting
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
X-List-Received-Date: Wed, 23 Oct 2013 18:51:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Series Acked-by: Chase Maupin <chase.maupin@ti.com>


>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Rini, Tom
>Sent: Wednesday, October 23, 2013 1:26 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH 0/3] Update SD card auto-mounting
>
>The following short series gets SD card auto-mounting working
>again.  I
>don't know if we want to try and push this new method upstream or
>if
>it's been decided to be distro policy (I assume the latter).  This
>enables 'stat' on our busybox config which as the commit message
>explains is quite hard to replicate in just shell and avoids
>requiring
>coreutils and is a re-sync with openembedded-core.  This is needed
>since
>/etc/udev/scripts/mount.sh requires 'stat' to exist and work for
>auto-mounting of things not in /etc/fstab.  The next change adds a
>udev
>rule for mounting (and cleaning up) on SD card insertion
>(technically
>all mmcblk devices, so eMMC too, which is helpful).  Finally, we
>drop
>the mount-sdcard package and initscript as we don't need it
>anymore.
>
>--
>Tom
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

