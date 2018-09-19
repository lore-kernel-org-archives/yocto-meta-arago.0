Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 8D66352A0E
	for <meta-arago@arago-project.org>;
	Wed, 19 Sep 2018 16:10:22 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8JGAETF072699
	for <meta-arago@arago-project.org>; Wed, 19 Sep 2018 11:10:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537373414;
	bh=bzQd7ALE6N30G/M1ZWWr6foSfOxYqJ99KX2gRqq+JQo=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=D2PakZPXxf8EKjNJI6FJaL4+LMMzF3nnA9s0b8UA3KeS50Xwb+PualOWZr/4P1Zb/
	xH3GfCJBKArSjJRJckuZ1s8XwkZj0/GTW0/oQ2lIytHtZvO+ZgG9Zrnrc9V5uArJxo
	NqN7JmQmbkgIaVNM96OFaBjog2WOpXcgkgye6/p0=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8JGAEHW011261
	for <meta-arago@arago-project.org>; Wed, 19 Sep 2018 11:10:14 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 19 Sep 2018 11:10:14 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 19 Sep 2018 11:10:14 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8JGADoL001072;
	Wed, 19 Sep 2018 11:10:13 -0500
To: Eric Ruei <e-ruei1@ti.com>, <meta-arago@arago-project.org>
References: <1536959265-3351-1-git-send-email-e-ruei1@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <9aa606d2-2c85-275a-7835-390c5cac1e03@ti.com>
Date: Wed, 19 Sep 2018 12:10:13 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1536959265-3351-1-git-send-email-e-ruei1@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [PATCH v2 0/2] Use the webkit-based broswer as the qt5 demo broswer for k3 devices
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
X-List-Received-Date: Wed, 19 Sep 2018 16:10:22 -0000
Content-Type: multipart/alternative;
	boundary="------------1400D336D315EA09FB61CB42"
Content-Language: en-US

--------------1400D336D315EA09FB61CB42
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Denys,

Can you please backport these to ti2018.03?


Thank you,

Jake


On 9/14/2018 5:07 PM, Eric Ruei wrote:
> V2 changes:
> rebase patch "matrix-gui: qt5-demos: break qt5 demos package into individual
> ones"
>
> Eric Ruei (2):
>    matrix-gui: qt5-demos: break qt5 demos package into individual ones
>    packagegroup-arago-tisdk-matrix: replace qt5 demo browser with webkit
>      broswer for K3 devices
>
>   .../packagegroup-arago-tisdk-matrix.bb              | 11 +++++++++--
>   .../recipes-core/matrix/matrix-gui-apps-git.inc     |  4 ++--
>   .../recipes-core/matrix/matrix-gui-qt5-demos_2.0.bb | 21 ++++++++++++++++++++-
>   3 files changed, 31 insertions(+), 5 deletions(-)
>


--------------1400D336D315EA09FB61CB42
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <pre class="content">Denys,

Can you please backport these to ti2018.03?


Thank you,

Jake</pre>
    <br>
    <div class="moz-cite-prefix">On 9/14/2018 5:07 PM, Eric Ruei wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1536959265-3351-1-git-send-email-e-ruei1@ti.com">
      <pre wrap="">V2 changes:
rebase patch "matrix-gui: qt5-demos: break qt5 demos package into individual 
ones"

Eric Ruei (2):
  matrix-gui: qt5-demos: break qt5 demos package into individual ones
  packagegroup-arago-tisdk-matrix: replace qt5 demo browser with webkit
    broswer for K3 devices

 .../packagegroup-arago-tisdk-matrix.bb              | 11 +++++++++--
 .../recipes-core/matrix/matrix-gui-apps-git.inc     |  4 ++--
 .../recipes-core/matrix/matrix-gui-qt5-demos_2.0.bb | 21 ++++++++++++++++++++-
 3 files changed, 31 insertions(+), 5 deletions(-)

</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------1400D336D315EA09FB61CB42--
