Return-Path: <vijaikumar.k@mistralsolutions.com>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by arago-project.org (Postfix) with ESMTPS id 37808529D9
	for <meta-arago@arago-project.org>;
	Sat,  8 Jul 2017 04:52:15 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id 77so70963203wrb.1
	for <meta-arago@arago-project.org>;
	Fri, 07 Jul 2017 21:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mistralsolutions.com; s=dkim;
	h=mime-version:from:date:message-id:subject:to;
	bh=CyGk1dm7DOGvGOtj4OukHiTYix3vPpZWUodk6xRkzGc=;
	b=Va5yHzZa33Dfu+0jzeS1JM7T4pAbdo82CZJIfGvCkq3lxt7RdE4SaiFA2qhnwnUxwC
	yBx0kssnbyXaesYZms6Ut06p1BjPZ6cn1nDL2X+HHdidnzzIVnKlPXkpJiFnyEAW5cIp
	EfnfrLsD3NjKJamyvmfaf3U8zSKy7jTcwVmM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=CyGk1dm7DOGvGOtj4OukHiTYix3vPpZWUodk6xRkzGc=;
	b=K8GpFA5v3eWPJ1IB8Tmi8IgbuPxDnAw1ROJl5BBwzutSjzA3mV/uMQAxAdIgVY0tl/
	7h0UH6Qdz+xKSIl4tNsX4oZXTQWz1E9YbXdQDlboVGnaeTA2DgtncRlNGaiJmmhMQMe3
	kbwix9k7AxSMxrz+6wkjygrYCncLND/kIsyRKXqvsvf31Gg5xndb5uZxCjnPxj8ztgVO
	h0EH3vjKoYxo/bHGWTbpIB6wxg8797gnzik7nQgESQKLSCC3HLdVjhju4LqvZi4UGNDq
	qdt+V0RGhISxbthPYF+h1uYfoT5L5Z9DyvJZg8hF44jXR1HFINsygUC9olilQVV0VRUA
	8iKA==
X-Gm-Message-State: AIVw112KkOXl9d4roZTRwYBATcjzytQFr4R1wLhiAFnBJalhmpDCxSB+
	zgkJGPf72gZJJQ0E/hzx4EXcs9bA58G6
X-Received: by 10.223.147.98 with SMTP id 89mr2534205wro.103.1499489534624;
	Fri, 07 Jul 2017 21:52:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.58.135 with HTTP; Fri, 7 Jul 2017 21:51:54 -0700 (PDT)
From: vijaikumar k <vijaikumar.k@mistralsolutions.com>
Date: Sat, 8 Jul 2017 10:21:54 +0530
Message-ID: <CADOTBT0JSbMsc7t71ZYS8MELag6vK2k83BEbcZMtcDGtm-NJpQ@mail.gmail.com>
To: meta-arago@arago-project.org
Subject: Use of repo instead of oe-layersetup script
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
X-List-Received-Date: Sat, 08 Jul 2017 04:52:15 -0000
Content-Type: text/plain; charset="UTF-8"

Hi All,

Just wondering, why can't we use repo to clone projects instead of
oe-layersetup script. We could split the current script into a
manifest and a env setup script. We could have the env setup script
inside meta-arago. So the whole command for setting up an Arago
project would be something like this.

repo init -u <url>/manifest.git -b arago-morty
repo sync

./sources/meta-arago/env-int.sh


Thanks,
Vijai Kumar K

