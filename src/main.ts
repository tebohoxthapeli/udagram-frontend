import { enableProdMode } from "@angular/core";
import { platformBrowserDynamic } from "@angular/platform-browser-dynamic";

import { AppModule } from "./app/app.module";
import { environment } from "./environments/environment";

try {
	console.log("frontend port:", process.env.PORT);
} catch (e) {
	console.log("failed to get PORT");
}

if (environment.production) {
	enableProdMode();
}

platformBrowserDynamic()
	.bootstrapModule(AppModule)
	.catch((err) => console.log(err));
